

resource "azurerm_function_app" "fn" {
  name                       = "${var.company}-${var.env}-fn"
  location                   = "${var.rg_location}"
  resource_group_name        = "${var.rg_name}"
  app_service_plan_id        = "${var.app_service_plan_id}"
  storage_account_name       = "${var.storage_account_name}"
  storage_account_access_key = "${var.storage_account_access_key}"
}