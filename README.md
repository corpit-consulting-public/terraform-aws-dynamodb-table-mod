# Tf-aws-dynamodb

Terraform module which creates Dynamodb Tables resources on AWS.


 _IMPORTANT!_* 
  You can define a maximum of 5 local secondary indexes and 5 global secondary indexes per table.
  Maximum autoscaling capacity and threshold default configuration can be overwritten from module or variables.tf *

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



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|

