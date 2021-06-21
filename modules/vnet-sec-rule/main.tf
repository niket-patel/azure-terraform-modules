resource "azurerm_network_security_rule" "vnetInRule" {
  name                        = "${var.vnetSG_name}-vnetInRule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.rg_name}"
  network_security_group_name = "${var.vnetSG_name}"
  
}