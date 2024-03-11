variables {
  bucket_name         = "bucket-name"
  dynamodb_table_name = "dynamodb-name"
}

mock_provider "aws" {}

run "check_dynamodb_table" {
  command = plan
  assert {
    condition     = aws_dynamodb_table.terraform_locks.name == "dynamodb-name"
    error_message = "DynamoDB Table name should equal var.dynamodb_table_name"
  }
}
