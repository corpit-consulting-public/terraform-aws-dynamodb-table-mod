
# tf-aws-dynamodb

Terraform module which creates Dynamodb Tables resources on AWS.


 _IMPORTANT!_ 
 _You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
  Maximum autoscaling capacity and threshold default configuration can be overwritten from module or variables.tf_

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `terraform12` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform11` branch.

## Features
  -  Autoscaling
  -  Point-in-time recovery
  -  Server side encryption
  -  Local secondary index creation (optional)
  -  Global secondary index creation and autoscaling (optional)
  -  TTL  (optional)
  -  Stream  (optional)

## Usage

```hcl
module "dynamodb-Table" {
  source                   = "./modules/terraform-aws-dynamodb-table"
  name                     = var.name
  billing_mode             = var.billing_mode
  read_capacity            = var.read_capacity
  write_capacity           = var.write_capacity
  hash_key                 = var.hash_key
  range_key                = var.range_key
  attribute                = [
      {
       name = "id"
       type = "S"
      },
      {
       name = "version"
       type = "N"
      },{
        name = "tf12"
        type = "S"
      }
     ]
  local_secondary_index = [
    {
      name               = "tf-local"
      range_key          = "corpit"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]
  global_secondary_index = [
    {
      name               = "tf-global"
      hash_key           = "id"
      range_key          = "version"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]
}


```
## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.

