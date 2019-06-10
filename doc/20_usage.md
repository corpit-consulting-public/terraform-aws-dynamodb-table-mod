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

