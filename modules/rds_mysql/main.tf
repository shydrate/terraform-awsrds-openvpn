resource "aws_db_parameter_group" "db_parameter_group" {
  name   = "db-parameter"
  family = "mysql8.0"
}
resource "aws_db_subnet_group" "db_subment_group" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_@%^"
}

resource "aws_secretsmanager_secret" "password" {
  name        = "db_pass"
  description = "RDS password for ${var.db_name}"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.password.result
}


resource "aws_db_instance" "mysql_db_instance" {
  identifier             = var.identifier_name
  db_name                = var.db_name
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  engine                 = "mysql"
  engine_version         = "8.0.28"
  username               = var.db_username
  password               = aws_secretsmanager_secret_version.password.secret_string
  db_subnet_group_name   = aws_db_subnet_group.db_subment_group.name
  vpc_security_group_ids = var.security_group_ids
  parameter_group_name   = aws_db_parameter_group.db_parameter_group.name
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = true
  apply_immediately      = true
}