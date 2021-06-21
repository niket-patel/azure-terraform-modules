resource "azurerm_virtual_network" "vnet" {
  name                = "${var.company}-${var.env}-vnet"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
/*
    subnet {
    name           = "${var.company}-${var.env}-vnet-subnet1"
    #service_endpoint = "Microsoft.Web"
    address_prefix = "10.0.1.0/24"      
  }
  */
  tags = {
    environment = "${var.env}"
  }
}

