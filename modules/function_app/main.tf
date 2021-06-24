resource "azurerm_function_app" "fn" {
  name                       = "${var.company}-${var.env}-fn"
  location                   = "${var.rg_location}"
  resource_group_name        = "${var.rg_name}"
  app_service_plan_id        = "${var.app_service_plan_id}"
  storage_account_name       = "${var.storage_account_name}"
  storage_account_access_key = "${var.storage_account_access_key}"

  site_config {

    ip_restriction {
        
        name = "front-door-access"
        priority = "300"
        action = "Allow"
        service_tag="AzureFrontDoor.Backend"
        headers = [ {
          "x_azure_fdid" = ["78a4a09c-f13d-41cc-bd34-54901b3f4eab"],
          "x_fd_health_probe" = [],
          "x_forwarded_for" = [] ,
          "x_forwarded_host" = [] 
          }
        ]
      }
  }

   
}