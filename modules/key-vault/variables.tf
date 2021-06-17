variable "company" {  
  type        = string
}
variable "env" {
  type        = string
}
variable "rg_location" {
  type        = string
}

variable "rg_name" {
  type        = string
}

variable "tenant_id" {
  type        = string
}

variable "object_id" {
  description = "object id"
  type        = string
}

variable "enabled_for_disk_encryption" {
 type        = bool
}
variable "soft_delete_retention_days" {
  type        = number
}
variable "purge_protection_enabled" {
	type= bool
}
variable "sku_name" {
	type= string
}