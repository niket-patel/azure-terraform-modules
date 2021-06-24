resource "azurerm_network_security_group" "vnetSG" {
  name                     = "${var.company}-${var.env}-vnetSG"
  location                 = "${var.rg_location}"
  resource_group_name      = "${var.rg_name}"
}