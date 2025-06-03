resource "aws_vpc" "rds_vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = var.subnet_cidr_1
  availability_zone = var.availability_zone_1
  tags              = var.tags
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = var.subnet_cidr_2
  availability_zone = var.availability_zone_2
  tags              = var.tags
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags       = var.tags
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-mysql-sg"
  vpc_id = aws_vpc.rds_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Restrict to VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_db_instance" "mysql" {
  identifier              = "mysql-rds"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  allocated_storage       = 20
  storage_type            = "gp2"
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  multi_az                = true
  backup_retention_period = 7
  skip_final_snapshot     = true
  tags                    = var.tags
}