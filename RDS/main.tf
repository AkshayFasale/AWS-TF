module "rds" {
  source              = "./modules/rds"
  vpc_cidr            = var.vpc_cidr
  subnet_cidr_1       = var.subnet_cidr_1
  subnet_cidr_2       = var.subnet_cidr_2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  db_instance_class   = var.db_instance_class
  region              = var.aws_region
  tags = {
    Name        = "mysql-rds"
    Environment = "Production"
  }
}