resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name                  = var.name #"dnszonelink"
  resource_group_name   = var.resource_group_name #module.resource_group.resource_group_name
  private_dns_zone_name = var.private_dns_zone_name #module.dns_privatezone.private_dns_zone_name
  virtual_network_id    = var.virtual_network_id #"/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1"
}