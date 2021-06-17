resource "azurerm_app_configuration" "appconf" {
  name                = "${var.company}-${var.env}-appconf"
  resource_group_name = "${var.rg_name}"
  location            = "${var.rg_location}"
  
}