module "mysql" {
  source            = "./modules/rds_mysql"
  identifier_name   = "demo-mysql"
  instance_class    = "db.m5.2xlarge" #use any based on your requirements
  db_name           = ""
  db_username       = "admin"
  allocated_storage = 20
  publicly_accessible = "false"
  security_group_ids = [
    module.security_groups.tcp_3306.id
  ]
  subnet_ids = [
    module.dev-vpc.private_subnets_1a,
    module.dev-vpc.private_subnets_1b
  ]
  parameters = [
    {
      name  = "log_bin_trust_function_creators"
      value = "1"
    },
    {
      name  = "time_zone"
      value = "Asia/Calcutta"
    }
  ]
}

output "db_endpoint" {
  value = module.mysql.db_endpoint
}

output "db_username" {
  value = module.mysql.db_username
}

output "db_password" {
  value     = module.mysql.db_password
  sensitive = true
}