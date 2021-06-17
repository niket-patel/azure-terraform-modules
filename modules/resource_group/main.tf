resource "azurerm_resource_group" "rg" {
  name     = "${var.company}-${var.env}-rg"
  location = "${var.location}"
}