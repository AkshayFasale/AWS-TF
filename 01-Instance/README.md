# EC2 Web Server with Terraform

This Terraform project deploys a public AWS EC2 instance running an Nginx web server in a custom VPC.
Overview
Infrastructure: Includes a VPC with a public subnet, internet gateway, and route table for internet access.

Security: A security group allows HTTP (port 80) and SSH (port 22) traffic for access and management.

EC2 Setup: Uses Amazon Linux 2 AMI and t2.micro instance, with a user data script to install and start Nginx.

Networking: Subnet assigns public IPs; an output provides the instance’s public IP for testing.

Configuration: Variables for region, availability zone, AMI ID, and instance type ensure reusability.

Key Features

Terraform Concepts: Demonstrates providers, resources, variables, outputs, and dependency management.

AWS Services: Utilizes EC2, VPC, subnet, security group, internet gateway, and route table.

Best Practices: Follows infrastructure-as-code principles for consistent, repeatable deployments.

Testing Instructions

Run terraform apply, access the public IP in a browser to view the Nginx welcome page, and SSH into the instance to verify.

Use terraform destroy to clean up resources after testing.