variable "resource_group_name" {
  description = "Name of the Azure Resource Group for the Storage Account"
  type        = string
  default     = "abhi-rg-for-blobsa"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "abhistoragev2"
}