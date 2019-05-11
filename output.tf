output "id" {
  description = "Table name"
  value = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.id,aws_dynamodb_table.dynamodb-table-2.*.id),0)}"
}
output "arn" {
  description = "Table ARN"
  value       = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.arn,aws_dynamodb_table.dynamodb-table-2.*.arn),0)}"
}

#output "id" {
 # description = "Table name"
#  value       = "${aws_dynamodb_table.basic-dynamodb-table.id}"
#}
