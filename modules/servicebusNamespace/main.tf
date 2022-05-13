resource "azurerm_servicebus_namespace" "servicebus_namespace" {
    name                = var.name
    resource_group_name = var.resource_group_name
    location            = var.location
    sku                 = var.sku
    capacity            = var.capacity
    local_auth_enabled  = var.local_auth_enabled
    zone_redundant      = var.zone_redundant
    tags                = var.tags

    identity    {
        type            = var.type
        identity_ids    = var.identity_ids
    }
}