# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"      
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}
data "azurerm_client_config" "clientconfig" {}

module "mod-rg" {
	source = "../modules/resource_group" 
	company = "${var.company}"  
	env = "${var.env}"
	location = "${var.location}"  
}

module "mod-storage" {
	source = "../modules/storage"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	storage_account_tier = "${var.storage_account_tier}"
	storage_account_replication_type = "${var.storage_account_replication_type}"
}

module "mod-appconfig" {
	source = "../modules/app_config"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location 
}

module "mod-kv" {
	source = "../modules/key-vault"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location 
	tenant_id = data.azurerm_client_config.clientconfig.tenant_id
	object_id = data.azurerm_client_config.clientconfig.object_id
	sku_name = "${var.kv_sku_name}"
	enabled_for_disk_encryption= "${var.kv_purge_protection_enabled}"
	soft_delete_retention_days= "${var.kv_soft_delete_retention_days}"
	purge_protection_enabled = "${var.kv_purge_protection_enabled}"

}

module "mod-app_plan" {
	source = "../modules/app_service_plan"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	app_plan_tier = "${var.app_plan_tier}"
	app_plan_size = "${var.app_plan_size}"
}

module "mod-fn" {
	source = "../modules/function_app"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	app_service_plan_id = module.mod-app_plan.id
	storage_account_name = module.mod-storage.name
	storage_account_access_key =module.mod-storage.primary_access_key
}

module "mod-vnetSG" {
	source = "../modules/vnet-sec-group"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location	
}
module "mod-vnetInRule" {
	source = "../modules/vnet-sec-rule"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location	
	vnetSG_name = module.mod-vnetSG.name
}
module "mod-vnet" {
	source = "../modules/vnet-sec"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	
}

module "mod-subnet" {
	source = "../modules/subnet"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	vnet_name = "${var.company}-${var.env}-vnet"  	
} 
module "mod-fd" {
	source = "../modules/network/front-door"
	company = "${var.company}"
	env = "${var.env}"
	rg_name = module.mod-rg.name
	rg_location = module.mod-rg.location
	fn_host_name = module.mod-fn.defaultHostName
}