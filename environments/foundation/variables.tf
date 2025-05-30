variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "01D376-B6A690-E5B3EE"
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "38372291649"
}

variable "billing_project" {
  description = "The project id to use for billing"
  type        = string
  default     = "cs-host-5806e9d2ba9f40968cdc3f"
}

variable "folders" {
  description = "Folder structure as a map"
  type        = map
}
