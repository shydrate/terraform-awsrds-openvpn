module "security_groups" {
  source = "./modules/security-group"
  vpc_id = module.dev-vpc.vpc_id
}

moved {
  from = aws_security_group.tcp_3306
  to   = module.security_groups.aws_security_group.tcp_3306
}
