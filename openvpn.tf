data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["dev-vpc"]
  }
}

resource "aws_instance" "openvpn-deploy" {
  ami                    = var.ami
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.openvpn-deploy.id]
  subnet_id              = module.dev-vpc.public_subnets_1a #aws_subnet.public-ap-south-1a.id
  tags = {
    Name    = "openvpn-server"
  }
}




#Create security group with firewall rules
resource "aws_security_group" "openvpn-deploy" {
  name        = var.openvpn-sgp
  description = "security group for alpha project deployments"
  vpc_id      = module.dev-vpc.vpc_id #aws_vpc.dev-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "custom udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = data.aws_vpc.vpc.cidr_blocks #["10.0.0.0/16"] #cidr block of VPC
  }
  #outbound from ec2 server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    project = "openvpn"
  }
}

output "ec2-instance" {
  value = aws_instance.openvpn-deploy.public_ip
}
