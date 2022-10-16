module "dev-vpc" {
  source = "./modules/vpc"
}


moved {
  from = aws_vpc.dev-vpc
  to   = module.dev-vpc.aws_vpc.vpc
}

moved {
  from = aws_subnet.private-ap-south-1a
  to   = module.dev-vpc.aws_subnet.private-ap-south-1a
}

moved {
  from = aws_subnet.private-ap-south-1b
  to   = module.dev-vpc.aws_subnet.private-ap-south-1b
}

moved {
  from = aws_subnet.private-ap-south-1b
  to   = module.dev-vpc.aws_subnet.private-ap-south-1b
}

moved {
  from = aws_subnet.public-ap-south-1a
  to   = module.dev-vpc.aws_subnet.public-ap-south-1a
}

moved {
  from = aws_subnet.public-ap-south-1b
  to   = module.dev-vpc.aws_subnet.public-ap-south-1b
}

moved {
  from = aws_internet_gateway.igw
  to   = module.dev-vpc.aws_internet_gateway.igw
}

moved {
  from = aws_eip.nat
  to   = module.dev-vpc.aws_eip.nat
}


moved {
  from = aws_nat_gateway.nat
  to   = module.dev-vpc.aws_nat_gateway.nat
}

moved {
  from = aws_route_table.private
  to   = module.dev-vpc.aws_route_table.private
}

moved {
  from = aws_route_table.public
  to   = module.dev-vpc.aws_route_table.public
}

moved {
  from = aws_route_table_association.private-ap-south-1a
  to   = module.dev-vpc.aws_route_table_association.private-ap-south-1a
}

moved {
  from = aws_route_table_association.private-ap-south-1b
  to   = module.dev-vpc.aws_route_table_association.private-ap-south-1b
}

moved {
  from = aws_route_table_association.public-ap-south-1a
  to   = module.dev-vpc.aws_route_table_association.public-ap-south-1a
}

moved {
  from = aws_route_table_association.public-ap-south-1b
  to   = module.dev-vpc.aws_route_table_association.public-ap-south-1b
}