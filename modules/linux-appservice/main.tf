resource "azurerm_resource_group" "this" {
  name     = var.usr_resource_group_name
  location = coalesce(var.usr_resource_group_location, var.usr_location)

  # RG already exists in East US — do not try to move it when usr_location changes for App Service
  lifecycle {
    ignore_changes = [location]
  }
}

resource "azurerm_service_plan" "app_service_plan" {
  count = var.usr_existing_service_plan_id == null ? 1 : 0

  name                = var.usr_app_service_plan_name
  location            = var.usr_location
  resource_group_name = azurerm_resource_group.this.name
  os_type             = "Linux"
  sku_name            = var.usr_app_service_plan_sku
}

locals {
  service_plan_id = coalesce(
    var.usr_existing_service_plan_id,
    try(azurerm_service_plan.app_service_plan[0].id, null)
  )
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.usr_app_name
  location            = var.usr_location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_id     = local.service_plan_id
  tags                = var.usr_app_tags

  site_config {
    always_on           = true
    minimum_tls_version = "1.2"
    ftps_state          = "FtpsOnly"
    http2_enabled       = true

    application_stack {
      docker_image_name   = local.docker_image_name
      docker_registry_url = local.docker_registry_url
    }
  }

  app_settings = local.merged_app_settings
}
