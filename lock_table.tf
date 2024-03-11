resource "aws_dynamodb_table" "terraform_locks" {
  name                        = coalesce(var.dynamodb_table_name, var.bucket_name)
  billing_mode                = "PAY_PER_REQUEST"
  hash_key                    = "LockID"
  deletion_protection_enabled = true

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    kms_key_arn = var.dynamodb_encryption_key
    enabled     = true
  }

  tags = var.dynamodb_tags
}
