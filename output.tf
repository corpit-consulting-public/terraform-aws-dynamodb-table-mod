output "id" {
  description = "Table name"
  value = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.id,aws_dynamodb_table.dynamodb-table-1_on_demand.*.id,aws_dynamodb_table.dynamodb-table-2.*.id,aws_dynamodb_table.dynamodb-table-3.*.id),0)}"
}
output "arn" {
  description = "Table ARN"
  value       = "${element(coalescelist(aws_dynamodb_table.dynamodb-table-1.*.arn,aws_dynamodb_table.dynamodb-table-1_on_demand.*.arn,aws_dynamodb_table.dynamodb-table-2.*.arn,aws_dynamodb_table.dynamodb-table-3.*.arn),0)}"
}

#output "id" {
 # description = "Table name"
#  value       = "${aws_dynamodb_table.basic-dynamodb-table.id}"
#}
