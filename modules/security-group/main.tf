
resource "aws_security_group" "tcp_3306" {
  name        = "tcp_3306"
  description = "security group for TCP incoming at port 3306"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    cidr_blocks = ["10.0.0.0/16"]
  }
}

