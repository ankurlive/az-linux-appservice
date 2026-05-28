# CFES pattern: app config in locals (not terraform.tfvars)

locals {
  env = "npe"

  npe = {
    linux_appservice = {
      "myapp-web-dev" = {
        usr_resource_group_name     = "myapp-rg-dev"
        usr_location                = "East US"
        usr_resource_group_location = "East US"
        usr_app_service_plan_name   = "myapp-web-dev-plan"
        usr_app_name                = "app2805m4n8q1r2"
        usr_app_service_plan_sku    = "B1"
        usr_container_image         = "nginx"
        usr_container_port          = 80
        usr_app_settings            = {}
        usr_app_tags                = {}
      }
    }
  }

  prd = {
    linux_appservice = {}
  }
}
