resource "azurerm_mssql_server" "mssql_server" {
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  version                              = var.sql_version
  administrator_login                  = var.administrator_login
  administrator_login_password         = var.administrator_login_password
  connection_policy                    = var.connection_policy
  minimum_tls_version                  = var.minimum_tls_version
  public_network_access_enabled        = var.public_network_access_enabled
  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = var.primary_user_assigned_identity_id
  tags                                 = var.tags

  lifecycle {
    ignore_changes = [
      tags["CreatedDate"]
    ]
  }

  azuread_administrator {
    login_username              = var.login_username
    object_id                   = var.object_id
    tenant_id                   = var.tenant_id
    azuread_authentication_only = var.azuread_authentication_only
  }

  identity {
    type         = var.type
    identity_ids = var.identity_ids
  }
}

resource "azurerm_mssql_virtual_network_rule" "mssql_virtual_network_rule" {
  count                                 = var.network_rule_count
  name                                  = "vnetRule${count.index}"
  server_id                             = var.server_id
  subnet_id                             = var.subnet_id[count.index]
  ignore_missing_vnet_service_endpoint  = var.ignore_missing_vnet_service_endpoint
}