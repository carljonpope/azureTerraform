output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_privatezone.id
}

output "private_dns_zone_name" {
  value = azurerm_private_dns_zone.dns_privatezone.name
}