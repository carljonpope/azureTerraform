resource "azurerm_storage_account" "example" {

  name                     = var.saName
  resource_group_name      = var.rgName
  location                 = var.saLocation
  account_tier             = var.accTier     #"Standard"
  account_replication_type = var.replication #"GRS"
  min_tls_version          = "TLS1_2"

}