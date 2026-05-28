variable "usr_subscription_id" { type = string }
variable "usr_tenant_id" { type = string }
variable "usr_client_id" { type = string }
variable "usr_client_secret" {
  type      = string
  sensitive = true
}

variable "env" {
  type    = string
  default = "npe"
}

# All per-app values (including container) — set in terraform.tfvars
variable "linux_appservice" {
  type = map(object({
    usr_resource_group_name   = string
    usr_location                   = string
    usr_resource_group_location    = optional(string)
    usr_app_service_plan_name = string
    usr_app_name              = string
    usr_app_service_plan_sku       = optional(string, "S1")
    usr_existing_service_plan_id   = optional(string)
    usr_container_image            = string
    usr_container_port        = optional(number, 80)
    usr_app_settings          = optional(map(string), {})
    usr_app_tags              = optional(map(string), {})
  }))
}

variable "linux_appservice_prd" {
  type = map(object({
    usr_resource_group_name   = string
    usr_location                   = string
    usr_resource_group_location    = optional(string)
    usr_app_service_plan_name = string
    usr_app_name              = string
    usr_app_service_plan_sku       = optional(string, "S1")
    usr_existing_service_plan_id   = optional(string)
    usr_container_image            = string
    usr_container_port        = optional(number, 80)
    usr_app_settings          = optional(map(string), {})
    usr_app_tags              = optional(map(string), {})
  }))
  default = {}
}
