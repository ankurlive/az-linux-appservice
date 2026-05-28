terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.usr_subscription_id
  client_id       = var.usr_client_id
  client_secret   = var.usr_client_secret
  tenant_id       = var.usr_tenant_id
}
