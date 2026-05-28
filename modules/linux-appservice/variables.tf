# Container-only Linux App Service module (minimal inputs)

variable "usr_resource_group_name" { type = string }
variable "usr_location" {
  description = "Region for App Service Plan and Web App (can differ from RG home region)"
  type        = string
}

variable "usr_resource_group_location" {
  description = "Region used only when creating the RG (optional; existing RG keeps its region)"
  type        = string
  default     = null
}
variable "usr_app_service_plan_name" { type = string }
variable "usr_app_name" { type = string }

variable "usr_app_service_plan_sku" {
  type    = string
  default = "S1"
}

# Set to skip plan creation when East US has 409 capacity errors (use plan from Portal)
variable "usr_existing_service_plan_id" {
  type        = string
  default     = null
  description = "Optional. Full resource ID of an existing Linux App Service Plan in East US"
}

variable "usr_container_image" {
  description = "nginx or myregistry.azurecr.io/nginx:latest"
  type        = string
}

variable "usr_container_port" {
  type    = number
  default = 80
}

variable "usr_app_settings" {
  type    = map(string)
  default = {}
}

variable "usr_app_tags" {
  type    = map(string)
  default = {}
}
