### Naming module to standardize name mapping for resources
module "naming" {
  source = "git::https://github.com/carlos-castillo-a/naming-module.git?ref=v1.0.0"
}

### Locals 
locals {
  env_id = lookup(module.naming.env-map, var.environment, "env")
  type   = lookup(module.naming.type-map, "aws_s3_bucket", "typ")

  default_project = var.project != "" ? var.project : "no-id"

  name_prefix = format("%s-%s", local.default_project, local.env_id)
  name        = format("%s-%s", local.name_prefix, local.type)

  name_suffix        = var.name_suffix == "" ? "" : format("-%s", var.name_suffix)
}

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
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the bucket"
  default     = {}
}

# Public Access
variable "block_public_access" {
  type        = bool
  description = "(Optional) Blocks public access to objects"
  default     = true
}

# Versioning
variable "versioning_enabled" {
  type        = bool
  description = "(Optional) Versioning status"
  default     = true
}

# Other Input Vars
variable "environment" {
  type        = string
  description = "(Required) Environment variable for bucket"
}

variable "project" {
  type        = string
  description = "(Required) Project ID for bucket"
}