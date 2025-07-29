output "rds_endpoint" {
  description = "RDS Endpoint to use in Flask app"
  value       = aws_db_instance.rds_instance.endpoint
}
