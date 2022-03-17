resource "azurerm_resource_group" "example" {
  name     = var.rgName #var.resourceGroupName #format("%s-%s-%s-%s", var.orgName, var.prjName, var.envName, var.resName)
  location = var.rgLocation
 
 
 /* timeouts {
    create = "360m"
    delete = "360m"
  }
  */


}