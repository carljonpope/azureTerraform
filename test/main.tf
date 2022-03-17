resource "azurerm_resource_group" "example" {
  name     = local.myCount
  location = var.resourceGroupLocation

}