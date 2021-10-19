resource "azurerm_resource_group" "example" {
  name     = var.resourceGroupName
  location = var.resourceGroupLocation
  timeouts {
    create = "360m"
    delete = "360m"
  }
}