output "db_endpoint" {
  description = "db endpoint"
  value       = aws_db_instance.mysql_db_instance.endpoint
}

output "db_username" {
  description = "db username"
  value       = aws_db_instance.mysql_db_instance.username
}

output "db_password" {
  value       = aws_db_instance.mysql_db_instance.password
  description = "db password"
  sensitive   = true
}

output "publicly_accessible" {
  value = aws_db_instance.mysql_db_instance.publicly_accessible
  description = "determines if the rds instance should be accessible publicly or not"
}