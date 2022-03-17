module "test_rg" {

    source = "../modules/resourceGroup"
    rgName = var.resourceGroupName
    rgLocation = var.resourceGroupLocation

}

module "test_sa" {

    source = "../modules/storage_acc"
    rgName = module.test_rg.rgNameOut
    saName = var.storageAccName
    saLocation = module.test_rg.rgLocationOut
    accTier = var.saAccTier
    replication = var.saAccReplication

}