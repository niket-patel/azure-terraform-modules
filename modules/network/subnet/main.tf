resource "azurerm_subnet" "subnet" {
  name                 = "${var.company}-${var.env}-vnet-subnet1"
  resource_group_name  = "${var.rg_name}"
  virtual_network_name = "${var.vnetname}"
  address_prefixes     = ["10.0.1.0/24"] 
  service_endpoints = ["Microsoft.Web"]
    delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/networkinterfaces/*",
	  "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}