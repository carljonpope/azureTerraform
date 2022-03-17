locals {
  settings = defaults(var.settings, {
    create_storage_account = false,
    storage_account = {
        name = "",
        account_tier = "",
        min_tls_version = "",
        allow_blob_public_access = false,
        enable_https_traffic_only  = false,
        account_kind = "",
        replication_type = "",
        access_tier = ""
    }
  })
}