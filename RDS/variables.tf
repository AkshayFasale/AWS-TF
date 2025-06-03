variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_1" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "First availability zone for the subnet and RDS"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Second availability zone for the subnet and RDS"
  type        = string
  default     = "us-east-1b"
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
  default     = "ChangeMe123!" # Replace with a secure password
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}