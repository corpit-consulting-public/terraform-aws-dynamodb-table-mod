output "id" {
  description = "Table name"
  value = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.id,aws_dynamodb_table.dynamodb-table-1_on_demand.*.id,aws_dynamodb_table.dynamodb-table-2.*.id,aws_dynamodb_table.dynamodb-table-3.*.id),0)}"
}
output "arn" {
  description = "Table ARN"
  value       = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.arn,aws_dynamodb_table.dynamodb-table-1_on_demand.*.arn,aws_dynamodb_table.dynamodb-table-2.*.arn,aws_dynamodb_table.dynamodb-table-3.*.arn),0)}"
}

output "stream_arn" {
  description = "The ARN of the Table Stream. Only available when stream_enabled = true"
  value       = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.stream_arn,aws_dynamodb_table.dynamodb-table-1_on_demand.*.stream_arn,aws_dynamodb_table.dynamodb-table-2.*.stream_arn,aws_dynamodb_table.dynamodb-table-3.*.stream_arn),0)}"
}

output "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute."
  value       = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.hash_key,aws_dynamodb_table.dynamodb-table-1_on_demand.*.hash_key,aws_dynamodb_table.dynamodb-table-2.*.hash_key,aws_dynamodb_table.dynamodb-table-3.*.hash_key),0)}"
}

#output "id" {
 # description = "Table name"
#  value       = "${aws_dynamodb_table.basic-dynamodb-table.id}"
#}
