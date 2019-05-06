output "id" {
  description = "Table name"
  value       = "${aws_dynamodb_table.basic-dynamodb-table.id}"
}
