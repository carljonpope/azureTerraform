resource "azurerm_template_deployment" "terraform-arm" {
  name                = "terraform-arm-01"
  resource_group_name = "compute"

  template_body = file("src/mainTemplate.json")

  parameters = {

      "esVersion"=              "7.11.1"
        
        "esClusterName"=              "test"
        
        "azureCloudPlugin"=              "No"
        
        "azureCloudStorageAccountName"=              ""
        
        "azureCloudStorageAccountResourceGroup"=              ""
        
        "xpackPlugins"=              "Yes"
        
        "esAdditionalPlugins"=              ""
        
        "esAdditionalYaml"=              ""
        
        "samlMetadataUri"=              ""
        
        "samlServiceProviderUri"=              ""
        
        "esHeapSize"=              "200"
        
        "loadBalancerType"=              "internal"
        
        "loadBalancerInternalSku"=              "Basic"
        
        "loadBalancerExternalSku"=              "Basic"
        
        "vNetNewOrExisting"=              "existing"
        
        "vNetName"=              "vnet1"
        
        "vNetClusterSubnetName"=              "subnet1"
        
        "vNetLoadBalancerIp"=             "10.0.1.4"
        
        "vNetExistingResourceGroup"=              "networking"
        
        "vNetNewAddressPrefix"=              "10.0.0.0/16"
        
        "vNetNewClusterSubnetAddressPrefix"=              "10.0.1.0/24"
        
        "vNetAppGatewaySubnetName"=              "es-gateway-subnet"
        
        "vNetNewAppGatewaySubnetAddressPrefix"=              ""
        
        "kibana"=              "No"
        
        "vmKibanaAcceleratedNetworking"=              "Default"
        
        "kibanaAdditionalYaml"=              ""
        
        "logstash"=              "No"
        
        "vmLogstashAcceleratedNetworking"=              "Default"
        
        #"logstashHeapSize"=              0
        
        "logstashKeystorePassword"=              "Password1234"
        
        "logstashAdditionalYaml"=              ""
        
        "jumpbox"=              "No"
        
        "vmSizeDataNodes"=              "Standard_DS1_v2"
        
        "vmDataNodeAcceleratedNetworking"=              "Default"
        
       # "vmDataDiskCount"=              1
        
        "vmDataDiskSize"=              "32GiB"
        
        #"vmDataNodeCount"=              1
        
        "storageAccountType"=              "Standard"
        
        "dataNodesAreMasterEligible"=              "Yes"
        
        "vmHostNamePrefix"=              ""
        
        "vmMasterNodeAcceleratedNetworking"=              "Default"
        
        #"vmClientNodeCount"=              0
        
        "vmClientNodeAcceleratedNetworking"=              "Default"
        
        "adminUsername"=              "nobodynose"
        
        "authenticationType"=              "password"
        
        "adminPassword"=              "Password1234"
        
        "securityBootstrapPassword"=              "Password1234"
        
        "securityAdminPassword"=              "Password1234"
        
        "securityKibanaPassword"=              "Password1234"
        
        "securityLogstashPassword"=              "Password1234"
        
        "securityBeatsPassword"=              "Password1234"
        
        "securityApmPassword"=              "Password1234"
        
        "securityRemoteMonitoringPassword"=              "Password1234"
        
        "appGatewayTier"=              "Standard"
        
        "appGatewaySku"=              "Small"
        
        #"appGatewayCount"=              1
        
        "appGatewayCertBlob"=              ""
        
        "appGatewayCertPassword"=              "Password1234"
        
        "appGatewayEsHttpCertBlob"=              ""
        
        "appGatewayWafStatus"=              "Disabled"
        
        "appGatewayWafMode"=              "Detection"
        
        "location"=              "uksouth"

  }

  deployment_mode = "Incremental"
}
