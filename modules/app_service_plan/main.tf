resource "azurerm_app_service_plan" "app_plan" {
  name                = "${var.company}-${var.env}-service-plan"
  resource_group_name = "${var.rg_name}"
  location            = "${var.rg_location}"
  sku {
    tier = "${var.app_plan_tier}"
    size = "${var.app_plan_size}"
  }
}