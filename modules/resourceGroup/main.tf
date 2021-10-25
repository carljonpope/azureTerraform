resource "azurerm_resource_group" "example" {
  name     = var.resourceGroupName #format("%s-%s-%s-%s", var.orgName, var.prjName, var.envName, var.resName)
  location = var.resourceGroupLocation
 
 
 /* timeouts {
    create = "360m"
    delete = "360m"
  }
  */


}