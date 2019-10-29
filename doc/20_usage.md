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
