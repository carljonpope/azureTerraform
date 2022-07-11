module "mssqlserver" {
  source                       = "../modules/sqlServerTest"
  name                         = "mssqlserver"
  resource_group_name          = "compute"
  location                     = "uksouth"
  sql_version                  = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"
  login_username               = "carljonpope@hotmail.com"
  object_id                    = "9ea63675-1896-4d80-be7a-312bb3314682"
  tags = {
    environment = "production"
  }


  network_rule_count                   = 2                                  #var.network_rule_count
  rule_name                            = ["rule1",
                                          "rule2"
                                         ] #"test${count.index}"               #"vnetRule${count.index}"

  server_id                            = module.mssqlserver.mssql_server_id #var.server_id

  rule_subnet                           = ["/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1",
                                           "/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet2"
                                          ] #var.rule_subnets[count.index]
                                          
  ignore_missing_vnet_service_endpoint = true                               #var.ignore_missing_vnet_service_endpoint
}

/*
  # WOrking resource, commented out so that can test using as module.
  resource "azurerm_mssql_virtual_network_rule" "mssql_virtual_network_rule" {
  count                                 = 2 #var.network_rule_count
  name                                  = "test${count.index}" #"vnetRule${count.index}"
  server_id                             = module.mssqlserver.mssql_server_id #var.server_id
  subnet_id                             = var.rule_subnets[count.index] #"/subscriptions/dce8bc99-578d-48b8-be33-71b0c3a22d3a/resourceGroups/networking/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1" #var.subnet_id[count.index]
  ignore_missing_vnet_service_endpoint  = true #var.ignore_missing_vnet_service_endpoint
}
*/