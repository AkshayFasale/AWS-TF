# MySQL Database with Terraform and RDS
### I used Terraform to set up a MySQL database on AWS RDS, hosted in a secure VPC with private subnets. The database is configured with a custom name, username, and password, and runs on a db.t3.micro instance. I enabled Multi-AZ for high availability and automated backups for data protection. A security group restricts access to the VPC’s CIDR, and a DB subnet group places the database in private subnets across two availability zones. I organized the setup using a Terraform module (modules/rds) to make it reusable.
What I Learned

### Terraform Modules: Packaged RDS, VPC, and subnet resources in a module for clean, reusable code.
Core Concepts: Used providers, variables, outputs, and dependency management to build a secure database.
AWS RDS: Mastered RDS for managed databases, with Multi-AZ and private subnet security.
