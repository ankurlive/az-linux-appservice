# Auth only — set via terraform.tfvars, -var, or TF_VAR_usr_subscription_id etc.

variable "usr_subscription_id" { type = string }
variable "usr_tenant_id" { type = string }
variable "usr_client_id" { type = string }
variable "usr_client_secret" {
  type      = string
  sensitive = true
}
