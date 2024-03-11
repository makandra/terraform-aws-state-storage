output "s3_bucket" {
  description = "Map containing  name and ARN of the state bucket"
  value = {
    bucket-name = aws_s3_bucket.terraform_state.id
    bucket-arn  = aws_s3_bucket.terraform_state.arn
  }
}

output "dynamodb_table" {
  description = "Map containing name and ARN of the dynamodb table"
  value = {
    dynamodb-table-name = aws_dynamodb_table.terraform_locks.name
    dynamodb-table-arn  = aws_dynamodb_table.terraform_locks.arn
  }
}
