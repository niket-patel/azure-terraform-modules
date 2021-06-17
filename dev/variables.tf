variable "company" {  
  type        = string
}
variable "env" {
 type        = string
}
variable "location" {
  type        = string
}
variable "storage_account_tier" {
	type= string
}
variable "storage_account_replication_type" {
	type= string
}

variable "kv_enabled_for_disk_encryption" {
 type        = bool
}
variable "kv_soft_delete_retention_days" {
  type        = number
}
variable "kv_purge_protection_enabled" {
	type= bool
}
variable "kv_sku_name" {
	type= string
}
variable "app_plan_tier" {
  type = string
}
variable "app_plan_size" {
  type = string
}
