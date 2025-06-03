variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_1" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "region" {
  description = "AWS region for the RDS instance"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}