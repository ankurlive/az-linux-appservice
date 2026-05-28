usr_subscription_id = "xxxxxxxxx"
usr_tenant_id         = "xxxxxxxxxxxxxx"
usr_client_id         = "xxxxxxxxxxxxxx"
usr_client_secret     = "xxxxxxxxx"

env = "npe"

linux_appservice = {
  "myapp-web-dev" = {
    usr_resource_group_name        = "myapp-rg-dev"
    usr_location                   = "East US"
    usr_resource_group_location    = "East US"
    usr_app_service_plan_name      = "myapp-web-dev-plan"
    usr_app_name                   = "app2805m4n8q1r2"
    usr_app_service_plan_sku  = "B1"

    usr_container_image = "nginx"
    usr_container_port  = 80
  }
}
