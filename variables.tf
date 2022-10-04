# Bucket Vars
variable "name_override" {
  type        = string
  description = "(Optional) Allows custom name overriding default structure"
  default     = ""
}

variable "name_suffix" {
  type        = string
  description = "(Optional) Allows custom suffix to bucket name"
  default     = ""
}

variable "num" {
  type        = number
  description = "(Required) Number of buckets to create"
  default     = 1
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the bucket"
  default     = {}
}

# Public Access
variable "block_public_access" {
  type        = bool
  description = "(Optional) Blocl public access"
  default     = true
}

# Versioning
variable "versioning_status" {
  type        = string
  description = "(Optional) Versioning status"
  default     = "Enabled"
}

# Other Input Vars
variable "environment" {
  type        = string
  description = "(Required) Environment variable for bucket"
  default     = "ENV"
}

variable "project" {
  type        = string
  description = "(Required) Project ID for bucket"
  default     = "no-id"
}

### Locals 
locals {
  env_id = lookup(module.naming.env-map, var.environment, "env")
  type   = lookup(module.naming.type-map, "aws_s3_bucket", "typ")

  default_project = var.project != "" ? var.project : "no-id"

  name_prefix = format("%s_%s", local.default_project, local.env_id)
  name        = format("%s_%s", local.name_prefix, local.type)

  name_suffix = var.name_suffix == "" ? "" : format("_%s", var.name_suffix)
}

### Naming module to standardize naming for resources
module "naming" {
  source = "https://github.com/carlos-castillo-a/naming-module/blob/main/main.tf.git?ref=v1.0.0"
}