module "resource_group_01" {
  source   = "../../resourceGroup"
  name     = var.name01
  location = var.location
  tags     = var.tags
  }


module "resource_group_02" {
  source   = "../../resourceGroup"
  name     = var.name02
  location = var.location
  tags     = var.tags
  }
