output "appservicelinux_id" {
  value = [for k, m in module.linux-appservice : m.id]
}

output "appservicelinux_hostname" {
  value = { for k, m in module.linux-appservice : k => m.default_hostname }
}

output "appservicelinux_url" {
  value = { for k, m in module.linux-appservice : k => "https://${m.default_hostname}" }
}
