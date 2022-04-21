resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name #var.resourceGroupName #format("%s-%s-%s-%s", var.orgName, var.prjName, var.envName, var.resName)
  location = var.location
 
 
 /* timeouts {
    create = "360m"
    delete = "360m"
  }
  */


}