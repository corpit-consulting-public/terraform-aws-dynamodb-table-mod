
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attribute | List of nested attribute definitions. Only required for hash\_key and range\_key attributes. Each attribute has two properties | list(map(string)) | n/a | yes |
| hash\_key | The attribute to use as the hash \(partition\) key. Must also be defined as an attribute \(Required, Forces new resource\) | string | n/a | yes |
| name | Tne name of the table, this needs to be unique within a region | string | n/a | yes |
| attribute\_name | The name of attribute | string | `""` | no |
| attribute\_type | Attribute type, which must be a scalar type: S\(string\), N\(number\) or B\(binary data\) | string | `""` | no |
| billing\_mode | Crontrols how you are charged for read and writhe throughput and how you manage capacity. The valid values are PROVISIONED and PAY\_PER\_REQUEST. Default to PROVISIONED. | string | `"PROVISIONED"` | no |
| create | Used when creating the table \(defaults to 10 mins\) | string | `"10"` | no |
| delete | Used when deleting the table \(defaults to 10 mins\) | string | `"10"` | no |
| encryption\_enabled | Whether or not to enable encryption at rest using a AWS managed Customer Master Key. If enable is false then server is true the server-side encryption is set to aws managed CMK \(shoen as KMS in the AWS console\). The AWS KMS cocumentation explains the diference bettwen AWS owned an AWS managed CMKs | bool | `"false"` | no |
| global\_secondary\_index | Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc | list | `<list>` | no |
| has\_global\_secondary\_index | TRUE or FALSE | bool | `"false"` | no |
| has\_local\_secondary\_index | TRUE or FALSE | bool | `"false"` | no |
| local\_secondary\_index | Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you created the resource \(Optional, Forces new resource\) | list | `<list>` | no |
| point\_in\_time\_recovery | Point-in-time recovery options | string | `""` | no |
| range\_key | The attribute to use as the range \(sort\) key. Must also be defined as an attribute\(Optional, Force new resource\) | string | `""` | no |
| read\_capacity | The number of the read units for this table. If the billing\_mode is PROVISIONED, this field is required | string | `""` | no |
| server\_side\_encryption | Encryption at reset options. AWS DynamoDB tables are automatically encrypted at reset whit an AWS owned Customer Master KEy if this argument isn't specified | string | `""` | no |
| stream\_enabled | Indicates whether Streams are to be enabled \(true\) or disabled \(false\) | bool | `"false"` | no |
| stream\_view\_type | When an item in the table is modified, Tream\_View\_Type determines what information is writtem to the table's stream. Valid values are KEYS\_ONLY, NEW\_IMAGE, OLD\_IMAGE, NEW\_AND\_OLD\_IMAGES | string | `""` | no |
| tags | A map of tags to populate on the created table. Name, Environment | map(string) | `<map>` | no |
| time\_recovery\_enable | Whether to enable point-in-time-recovery-note that it can take up to 10 minutes to enable for new tables. If the point\_in\_time\_recovery block is not provided then this default to false | bool | `"false"` | no |
| ttl | Defines ttl, has two properties, and can only be specified once: | string | `""` | no |
| ttl\_attribute\_name | The name of the table attribute to store the TTL timestamp in | string | `""` | no |
| ttl\_enable | Indicates whether ttl is enabled \(true\) or disable \(false\) | bool | `"false"` | no |
| update | Used when updating the table configuration and reset for each individual Global Secondary Index update \(Defaults to 60 mins\) | string | `"60"` | no |
| write\_capacity | The number of the write units for thes table. If the billing\_mode is PROVISIONED, this field is required | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Table ARN |
| hash\_key | The attribute to use as the hash \(partition\) key. Must also be defined as an attribute. |
| id | Table name |
| stream\_arn | The ARN of the Table Stream. Only available when stream\_enabled = true |

