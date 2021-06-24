resource "azurerm_frontdoor" "fd" {
  name                                         = "${var.company}-${var.env}-fd"  
  resource_group_name                          = "${var.rg_name}"
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "httpToHttpsRedirect"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.company}-${var.env}-fd-fep"]
    
    redirect_configuration{
    redirect_type = "Found"
    redirect_protocol = "HttpsOnly"
   }
   
  }

  backend_pool_load_balancing {
    name = "lb-${var.company}-${var.env}-fd"
  }

  backend_pool_health_probe {
    name = "health-${var.company}-${var.env}-fd"
  }

  backend_pool {
    name = "${var.company}-${var.env}-fd-backend"
    backend {
      host_header = "${var.fn_host_name}"
      address     = "${var.fn_host_name}"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "lb-${var.company}-${var.env}-fd"
    health_probe_name   = "health-${var.company}-${var.env}-fd"
  }

  frontend_endpoint {
    name      = "${var.company}-${var.env}-fd-fep"
    host_name = "${var.company}-${var.env}-fd.azurefd.net"
  }

}