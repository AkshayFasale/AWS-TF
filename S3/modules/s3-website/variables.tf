variable "bucket_name" {
  description = "The globally unique name for the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region for the bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
}