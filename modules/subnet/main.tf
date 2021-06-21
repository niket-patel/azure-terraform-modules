resource "azurerm_subnet" "subnet" {
  name                 = "${var.company}-${var.env}-vnet-subnet1"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = "${var.vnet_name}"
  address_prefixes     = ["10.0.1.0/24"] 
  service_endpoints = ["Microsoft.Web"]
  
}