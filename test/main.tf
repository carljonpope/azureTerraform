module "client_config" {
  source    = "../modules/applications/clientConfig"
  name01    = "${var.prefix}-${var.env}-rg01"
  name02    = "${var.prefix}-${var.env}-rg02"
  location  = var.location
  tags      = {
    test1   = "test1"
    test2   = "test2"
  }
}