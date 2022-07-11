resource "azurerm_resource_group" "resource_group" {
  count     = var.number_of_rg
  name      = "rg${count.index+1}"
  location  = var.location
  tags      = var.tags
}
