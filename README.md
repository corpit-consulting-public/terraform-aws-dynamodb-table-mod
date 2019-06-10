
# tf-aws-dynamodb

Terraform module which creates Dynamodb Tables resources on AWS.


 _IMPORTANT!_ 
 _You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
  Maximum autoscaling capacity and threshold default configuration can be overwritten from module or variables.tf_

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

module "dynamodb-ETLProfile" {
####### Required: source = "./modules/tf-aws-dynamodb-table"
  source                   = "./modules/tf-aws-dynamodb-table"
  name                     = "${var.name}"
  billing_mode             = "${var.billing_mode}"
  read_capacity            = "${var.read_capcacity]}"
  write_capacity           = "${var.write_capacity]}"
  hash_key                 = "${var.hash_key}"
  range_key                = "${var.range_key}"
  attribute                = "${var.attribute}"
}

#########################################
#######with global secondary index#######

module "dynamodb-CdataConnectorsTable" {
####### Required: source = "./modules/tf-aws-dynamodb-table"
  source                   = "./modules/tf-aws-dynamodb-table"
  name                     = "${var.name}"
  billing_mode             = "${var.billing_mode}"
  read_capacity            = "${var.read_capacity}"
  write_capacity           = "${var.write_capacity}"
  hash_key                 = "${var.hash_key}"
  range_key                = "${var.range_key}"
  attribute                = "${var.attribute}"
  global_index_name               = "${var.global_index_name}"
  global_index_hash_key           = "${var.global_index_hash_key}"
  global_index_range_key          = "${var.global_index_range_key}"
  global_index_read_capacity      = "${var.global_index_read_capacity}"
  global_index_write_capacity     = "${var.global_index_write_capacity}"
  global_index_projection_type    = "${var.global_index_projection_type}"
  attribute                       = "${var.global_index_attribute}"
  has_global_secondary_index      = "true"
}

########################################
#######with local secondary index#######

module "AppSyncCommentTable-Mao819rm" {
  source           = "./modules/tf-aws-dynamodb-table"
  name             = "${var.name}"
  billing_mode     = "${var.billing_mode}"
  read_capacity    = "${var.read_capacity}"
  write_capacity   = "${var.write_capacity}"
  hash_key         = "${var.hash_key}"
  range_key        = "${var.range_key}"
  attribute        = "${var.attribute}"
  index_name                  = "${var.index_name}"
  index_range_key             = "${var.index_range_key}"
  projection_type             = "${var.projection_type}"
  has_local_secondary_index   = "true"
}
```
## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attribute | List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties | list | `<list>` | no |
| attribute\_name | The name of attribute | string | `""` | no |
| billing\_mode | Crontrols how you are charged for read and writhe throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Default to PROVISIONED. | string | `"PROVISIONED"` | no |
| create | Used when creating the table (defaults to 10 mins) | string | `"10"` | no |
| delete | Used when deleting the table (defaults to 10 mins) | string | `"10"` | no |
| encryption\_enabled | Whether or not to enable encryption at rest using a AWS managed Customer Master Key. If enable is false then server is true the server-side encryption is set to aws managed CMK (shoen as KMS in the AWS console). The AWS KMS cocumentation explains the diference bettwen AWS owned an AWS managed CMKs | string | `"false"` | no |
| global\_index\_hash\_key | The name of the hash key in the index; must be defined as an attribute in the resource | string | `""` | no |
| global\_index\_name | The name of the index | string | `""` | no |
| global\_index\_non\_key\_attributes | Only required with INCLUDE as a projection type; a list of attributes to project into the index. Thes do not need to be defined as attributes on the table | list | `<list>` | no |
| global\_index\_projection\_type | One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY project just the hash and range key into the index, and ICLUDE projects only the keys specified in the non_key_attributes parameter | string | `""` | no |
| global\_index\_range\_key | The name of the range key; must be defined | string | `""` | no |
| global\_index\_read\_capacity | The number of read units for this index. Must be set if billing_mode is set to PROVISIONED | string | `"10"` | no |
| global\_index\_write\_capacity | The number of write units for this index. Must be set if billing+mode is set to PROVISIONED | string | `"10"` | no |
| global\_secondary\_index | Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc | string | `""` | no |
| has\_global\_secondary\_index | TRUE or FALSE | string | `"false"` | no |
| has\_local\_secondary\_index | TRUE or FALSE | string | `"false"` | no |
| hash\_key | The attribute to use as the hash (partition) key. Must also be defined as an attribute (Required, Forces new resource) | string | `""` | no |
| index\_hash\_key | The name of the hash key; must be defined | string | `""` | no |
| index\_name | The name of the index | string | `""` | no |
| index\_range\_key | The name of the range key; must be defined | string | `""` | no |
| local\_secondary\_index | Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you created the resource (Optional, Forces new resource) | string | `""` | no |
| name | Tne name of the table, this needs to be unique within a region | string | `""` | no |
| non\_key\_attributes | Only required with INCLUDE as a projection type; a list of attributes to project into the index. These do not need to be defined as attributes on the table | list | `<list>` | no |
| point\_in\_time\_recovery | Point-in-time recovery options | string | `""` | no |
| projection\_type | One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, an INCLUDE projects only the keys specified the non_key_attributes parameter | string | `""` | no |
| range\_key | The attribute to use as the range (sort) key. Must also be defined as an attribute(Optional, Force new resource) | string | `""` | no |
| read\_capacity | The number of the read units for this table. If the billing_mode is PROVISIONED, this field is required | string | `""` | no |
| server\_side\_encryption | Encryption at reset options. AWS DynamoDB tables are automatically encrypted at reset whit an AWS owned Customer Master KEy if this argument isn't specified | string | `""` | no |
| stream\_enabled | Indicates whether Streams are to be enabled (true) or disabled (false) | string | `""` | no |
| stream\_view\_type | When an item in the table is modified, Tream_View_Type determines what information is writtem to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES | string | `""` | no |
| tags | A map of tags to populate on the created table. Name, Environment | map | `<map>` | no |
| time\_recovery\_enable | Whether to enable point-in-time-recovery-note that it can take up to 10 minutes to enable for new tables. If the point_in_time_recovery block is not provided then this default to false | string | `"false"` | no |
| ttl | Defines ttl, has two properties, and can only be specified once: | string | `""` | no |
| ttl\_attribute\_name | The name of the table attribute to store the TTL timestamp in | string | `""` | no |
| ttl\_enable | Indicates whether ttl is enabled (true) or disable (false) | string | `"false"` | no |
| type | Attribute type, which must be a scalar type: S(string), N(number) or B(binary data) | string | `""` | no |
| update | Used when updating the table configuration and reset for each individual Global Secondary Index update (Defaults to 60 mins) | string | `"60"` | no |
| write\_capacity | The number of the write units for thes table. If the billing_mode is PROVISIONED, this field is required | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Table ARN |
| id | Table name |

