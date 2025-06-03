variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The globally unique name for the S3 bucket"
  type        = string
  default     = "my-unique-static-site-2025-akshayfasale"
}