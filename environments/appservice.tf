module "linux-appservice" {
  for_each = var.env == "npe" ? local.npe.linux_appservice : local.prd.linux_appservice

  source = "../modules/linux-appservice"

  usr_resource_group_name   = each.value.usr_resource_group_name
  usr_location                = each.value.usr_location
  usr_resource_group_location = try(each.value.usr_resource_group_location, null)
  usr_app_service_plan_name = each.value.usr_app_service_plan_name
  usr_app_name              = each.value.usr_app_name
  usr_app_service_plan_sku         = each.value.usr_app_service_plan_sku
  usr_existing_service_plan_id   = try(each.value.usr_existing_service_plan_id, null)

  usr_container_image = each.value.usr_container_image
  usr_container_port  = each.value.usr_container_port
  usr_app_settings    = each.value.usr_app_settings
  usr_app_tags        = each.value.usr_app_tags
}
