output "id" {
  description = "Table name"
  value       = "${aws_dynamodb_table.basic-dynamodb-table.id}"
}

output "arn" {
  description = "Table ARN"
  value       = "${aws_dynamodb_table.basic-dynamodb-table.arn}"
}
