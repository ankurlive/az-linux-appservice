locals {
  image_parts = split("/", var.usr_container_image)

  use_custom_registry = length(local.image_parts) > 1 && can(regex("\\.", local.image_parts[0]))

  docker_registry_url = local.use_custom_registry ? "https://${local.image_parts[0]}" : "https://index.docker.io"
  docker_image_name   = local.use_custom_registry ? join("/", slice(local.image_parts, 1, length(local.image_parts))) : var.usr_container_image

  container_app_settings = {
    WEBSITES_PORT                       = tostring(var.usr_container_port)
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  merged_app_settings = merge(local.container_app_settings, var.usr_app_settings)
}
