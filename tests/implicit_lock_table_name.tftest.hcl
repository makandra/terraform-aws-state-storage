variables {
  bucket_name = "bucket-name"
}

mock_provider "aws" {}

run "check_dynamodb_table" {
  command = plan
  assert {
    condition     = aws_dynamodb_table.terraform_locks.name == "bucket-name"
    error_message = "DynamoDB Table name should equal var.bucket_name"
  }
}
