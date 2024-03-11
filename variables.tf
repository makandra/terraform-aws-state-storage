variable "bucket_name" {
  type        = string
  description = "Name of the state bucket that will be created"

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket names must be between 3 (min) and 63 (max) characters long"
  }

  validation {
    condition     = can(regex("^[a-z0-9.-]{1,64}$", var.bucket_name))
    error_message = "Bucket names can consist only of lowercase letters, numbers, dots (.), and hyphens (-)."
  }

  validation {
    condition     = can(regex("^[a-z0-9].*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket names must begin and end with a letter or number"
  }

  validation {
    condition     = !strcontains(var.bucket_name, "..")
    error_message = "Bucket names must not contain two adjacent periods."
  }

  validation {
    condition     = !can(regex("^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$", var.bucket_name))
    error_message = "Bucket names must not be formatted as an IP address (for example, 192.168.5.4)"
  }

  validation {
    condition     = !startswith(var.bucket_name, "xn--")
    error_message = "Bucket names must not start with the prefix xn--"
  }

  validation {
    condition     = !startswith(var.bucket_name, "sthree-")
    error_message = "Bucket names must not start with the prefix sthree-"
  }

  validation {
    condition     = !endswith(var.bucket_name, "-s3alias")
    error_message = "Bucket names must not end with the suffix -s3alias."
  }

  validation {
    condition     = !endswith(var.bucket_name, "--ol-s3")
    error_message = "Bucket names must not end with the suffix --ol-s3"
  }
}

variable "s3_encryption_key" {
  type        = string
  description = "ARN of the KMS key used to encrypt the state bucket. If not set the default s3 key will be used"
  default     = null
}

variable "s3_tags" {
  type        = map(string)
  description = "Map of strings containing tag keys and values for the state bucket"
  default     = {}
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the dynamodb table used for state locking. Defaults to bucket name if not set"
  default     = null
}

variable "dynamodb_encryption_key" {
  type        = string
  description = "ARN of the KMS key used to encrypt the dynamodb table used for state locking. If not set the default dynamodb key will be used."
  default     = null
}

variable "dynamodb_tags" {
  type        = map(string)
  description = "Map of strings containing tag keys and values for the dynamodb table"
  default     = {}
}
