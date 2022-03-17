data "azurerm_resource_group" "webapps" {
  name          = "webapps"
}

module "test_asp" {

    source      = "../modules/appServicePlan"
    aspName     = var.appServicePlanName
    rgName      = data.azurerm_resource_group.webapps.name
    aspLocation = var.appServicePlanlocation

}


module "test_as" {

    source      = "../modules/appService"
    asName      = var.appServiceName
    rgName      = data.azurerm_resource_group.webapps.name
    asLocation  = var.appServiceLocation
    aspId       = module.test_asp.aspIdOutput


}

module "test_as2" {

    source      = "../modules/appService"
    asName      = var.appServiceName2
    rgName      = data.azurerm_resource_group.webapps.name
    asLocation  = var.appServiceLocation
    aspId       = module.test_asp.aspIdOutput


}


module "test_as3" {

    source      = "../modules/appService"
    asName      = "cjptest-as03"
    rgName      = data.azurerm_resource_group.webapps.name
    asLocation  = var.appServiceLocation
    aspId       = module.test_asp.aspIdOutput


}