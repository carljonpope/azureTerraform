resource "azurerm_resource_group" "example" {
  name     = local.myCount
  location = var.resourceGroupLocation





/*module "rg2" {
  source = "../modules/resourceGroup"
  resourceGroupName = var.rg2Name
  resourceGroupLocation = var.resourceLocation
}


module "vnet1" {
    source = "../modules/vnet"
    vnetLocation = var.resourceLocation
}

resource "azurerm_virtual_network" "example" {
  name                = "virtualNetworkTest"
  location            = var.resourceLocation
  resource_group_name = "networking"
  address_space       = ["10.1.0.0/16"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.1.1.0/24"
  }

  tags = {
    environment = "Test"
  }
}*/
