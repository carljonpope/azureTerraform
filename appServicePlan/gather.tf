data "azurerm_client_config" "current" {

}

data "azurerm_key_vault" "icsfcssbxuksouthkv01" {
  name                = "icsfcssbxuksouthkv01"
  resource_group_name = "br-az-ics-fcs-sbx-kv-uksouth-rg-01"
}

data "azurerm_key_vault_secret" "clientConfigSql" {
  name         = "clientConfigSql"
  key_vault_id = data.azurerm_key_vault.icsfcssbxuksouthkv01.id
}