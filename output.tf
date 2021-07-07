output "id" {
  description = "Table name"
  value       = aws_dynamodb_table.dynamodb-table.id
}
output "arn" {
  description = "Table ARN"
  value       = aws_dynamodb_table.dynamodb-table.arn
}

output "stream_arn" {
  description = "The ARN of the Table Stream. Only available when stream_enabled = true"
  value       = aws_dynamodb_table.dynamodb-table.stream_arn
}

output "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute."
  value       = aws_dynamodb_table.dynamodb-table.hash_key
}

output "range_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute."
  value       = aws_dynamodb_table.dynamodb-table.range_key
}
