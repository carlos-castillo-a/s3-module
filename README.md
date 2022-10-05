# AWS Private And Encrypted S3 Bucket
This module defines the creation of an S3 Bucket with options on certain configurations. Versioning, public access of objects, and quantity of buckets can be changed via input variables

> _Note: KMS Encryption and Private ACL will be enabled using this module._

The naming of the bucket is determined by a [Naming Module](https://github.com/carlos-castillo-a/naming-module) and Input Variables listed below.

## Usage
 It is recommended to use `project` and `name_suffix` variables to acheive an ideal bucket name. An example of calling the module can be found below:

```HCL
variable "project" {
    type = string
}

variable "environment" {
    type = string
}

module "s3_module" {
  source      = "git::https://github.com/carlos-castillo-a/s3-module.git"
  project     = var.project
  environment = var.environment
  num         = 1
  name_suffix = "logging"
}
``` 
### Result:
```
aws0001_prod_bucket_001_logging  
   ↑      ↑    ↑     ↑     ↑
project  env  type  num  suffix 
```

## Input Variables
The following is a list of input variables that can be input when calling this module:

| Name                   | Type    | Default   | Required | Description
| -----------------------| ------- | --------- | -------- | --------------------------------------------------------
| project                | string  |           | ✓        | Project ID associate with bucket
| environment            | string  |           | ✓        | Environment bucket is created in (dev, stg, prod, etc.)
| num                    | string  |           | ✓        | Number of buckets to be created
| name_suffix            | string  |           |          | Suffix to the standard name of the bucket(s)
| name_override          | string  |           |          | Override option to standard naming module
| block_public_access    | bool    | `true`    |          | Block public access of objects in bucket (_All rules_)
| versioning_status      | string  | `Enabled` |          | Enables/Disables versioning for objects in buckets
| tags                   | map     |           |          | Map of tags to be applied to all resources


## Outputs
The following is a list of output variables that can be called from this module:

| Name                         | Description                                                       |
| ---------------------------- | ----------------------------------------------------------------- |
| bucket_arn                   | Bucket ARN                                                        |
| bucket_name                  | Bucket name                                                       |
