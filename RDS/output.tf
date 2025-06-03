output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.rds_endpoint
}

output "rds_port" {
  description = "Port of the RDS instance"
  value       = module.rds.rds_port
}