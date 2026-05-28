output "id" {
  value = azurerm_linux_web_app.app_service.id
}

output "default_hostname" {
  value = azurerm_linux_web_app.app_service.default_hostname
}
