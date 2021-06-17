resource "azurerm_key_vault" "kv" {
  name                        = "${var.company}-${var.env}-kv"
  location                    = "${var.rg_location}"
  resource_group_name         = "${var.rg_name}"  
  tenant_id                   = "${var.tenant_id}"
  enabled_for_disk_encryption = "${var.enabled_for_disk_encryption}"
  soft_delete_retention_days  = "${var.soft_delete_retention_days}"
  purge_protection_enabled    = "${var.purge_protection_enabled}"

  sku_name = "${var.sku_name}"

  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "${var.object_id}"

    secret_permissions = [
    "Get","List","Set","Delete","Recover","Backup","Restore","Purge"
    ]

  }
}
