variables {
  bucket_name       = "test-bucket-name"
  s3_encryption_key = "arn:aws:kms:eu-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}

mock_provider "aws" {}

run "bucket_name" {
  command = plan
  assert {
    condition     = aws_s3_bucket.terraform_state.bucket == var.bucket_name
    error_message = "S3 state bucket not created"
  }
}

run "bucket_versioning_attachment" {
  assert {
    condition     = aws_s3_bucket_versioning.terraform_state.bucket == aws_s3_bucket.terraform_state.id
    error_message = "Public access block is not attached to bucket"
  }
}

run "public_access_block_attachment" {
  assert {
    condition     = aws_s3_bucket_public_access_block.terraform_state.bucket == aws_s3_bucket.terraform_state.id
    error_message = "Public access block is not attached to bucket"
  }
}

run "encryption_config_attachment" {
  assert {
    condition     = aws_s3_bucket_server_side_encryption_configuration.terraform_state.bucket == aws_s3_bucket.terraform_state.bucket
    error_message = "Public access block is not attached to bucket"
  }
}

run "bucket_public" {
  command = plan
  assert {
    condition = (
      aws_s3_bucket_public_access_block.terraform_state.block_public_acls
      && aws_s3_bucket_public_access_block.terraform_state.block_public_policy
      && aws_s3_bucket_public_access_block.terraform_state.ignore_public_acls
      && aws_s3_bucket_public_access_block.terraform_state.restrict_public_buckets
    )
    error_message = "Bucket is public"
  }
}

run "bucket_versioning" {
  command = plan
  assert {
    condition     = aws_s3_bucket_versioning.terraform_state.versioning_configuration[0].status == "Enabled"
    error_message = "Bucket versioning is disabled"
  }
}

run "bucket_encryption" {
  command = plan
  assert {
    condition = alltrue(flatten([
      for rule in aws_s3_bucket_server_side_encryption_configuration.terraform_state.rule :
      rule.bucket_key_enabled == false
      && alltrue([
        for encryption in rule.apply_server_side_encryption_by_default : (
          encryption.sse_algorithm == "aws:kms"
          && encryption.kms_master_key_id == var.s3_encryption_key
        )
      ])

    ]))
    error_message = "Bucket encryption disabled"
  }
}
