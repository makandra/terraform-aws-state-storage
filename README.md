# Terraform Module AWS State Storage



## Requirements

?

## Providers

?

## Resources

| Name                                                                                                                                                                                             | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [aws_dynamodb_table.terraform_locks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)                                                                 | resource |
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)                                                                           | resource |
| [aws_s3_bucket_public_access_block.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)                                   | resource |
| [aws_s3_bucket_server_side_encryption_configuration.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)                                                     | resource |

## Inputs

| Name                                                                                                        | Description                                                                                                                     | Type          | Default                   | Required |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------- | ------------------------- | :------: |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name)                                       | Name of the state bucket that will be created                                                                                   | `string`      | n/a                       |   yes    |
| <a name="input_dynamodb_encryption_key"></a> [dynamodb\_encryption\_key](#input\_dynamodb\_encryption\_key) | ARN of the KMS key used to encrypt the dynamodb table used for state locking. If not set the default dynamodb key will be used. | `string`      | `null`                    |    no    |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name)             | Name of the dynamodb table used for state locking. Defaults to bucket name if not set                                           | `string`      | Defaults to `bucket_name` |    no    |
| <a name="input_dynamodb_tags"></a> [dynamodb\_tags](#input\_dynamodb\_tags)                                 | Map of strings containing tag keys and values for the dynamodb table                                                            | `map(string)` | `{}`                      |    no    |
| <a name="input_s3_encryption_key"></a> [s3\_encryption\_key](#input\_s3\_encryption\_key)                   | ARN of the KMS key used to encrypt the state bucket. If not set the default s3 key will be used                                 | `string`      | `null`                    |    no    |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags)                                                   | Map of strings containing tag keys and values for the state bucket                                                              | `map(string)` | `{}`                      |    no    |

## Outputs

| Name                                                                             | Description                                       |
| -------------------------------------------------------------------------------- | ------------------------------------------------- |
| <a name="output_dynamodb_table"></a> [dynamodb\_table](#output\_dynamodb\_table) | Map containing name and ARN of the dynamodb table |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket)                | Map containing  name and ARN of the state bucket  |
