variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_availability_zone" {
  description = "The availability zone to deploy the resources in"
  type        = string
  default     = "us-east-1a"
}

variable "AMI_ID" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance-type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}