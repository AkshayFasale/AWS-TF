resource "aws_instance" "my_instance" {
  ami                         = var.AMI_ID
  instance_type               = var.instance-type
  availability_zone           = var.aws_availability_zone
  subnet_id                   = aws_subnet.subnet01.id
  vpc_security_group_ids      = [aws_security_group.instance_sg_http.id]
  associate_public_ip_address = true
  key_name                    = "demoDkey"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "web-server"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "instance_vpc"
  }
}

resource "aws_subnet" "subnet01" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.16.0.0/24"
  availability_zone       = var.aws_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet01"
  }
}

resource "aws_security_group" "instance_sg_http" {
  name   = "ssh_http_access_sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance_sg"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.main.id
}
