resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  dynamic "attribute" {
    for_each = var.attribute
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      name = attribute.value.name
      type = attribute.value.type
    }
  }

  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  tags = var.tags
  
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null


  dynamic "global_secondary_index" {
      for_each = var.global_secondary_index

      content {
        name               = global_secondary_index.value.name
        hash_key           = global_secondary_index.value.hash_key
        projection_type    = global_secondary_index.value.projection_type
        range_key          = lookup(global_secondary_index.value, "range_key", null)
        non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
        read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
        write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
      }
  }

  dynamic "local_secondary_index" {
      for_each = var.local_secondary_index

      content {
        name               = local_secondary_index.value.name
        projection_type    = local_secondary_index.value.projection_type
        range_key          = local_secondary_index.value.range_key
        non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
      }
  }
}
