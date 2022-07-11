resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  azuread_administrator {
    login_username = var.login_username
    object_id      = var.object_id
  }

  tags = var.tags
}

resource "azurerm_mssql_virtual_network_rule" "mssql_virtual_network_rule" {
  count                                 = var.network_rule_count
  name                                  = var.rule_name[count.index]  #"test${count.index}"
  server_id                             = var.server_id
  subnet_id                             = var.rule_subnet[count.index]
  ignore_missing_vnet_service_endpoint  = var.ignore_missing_vnet_service_endpoint
}