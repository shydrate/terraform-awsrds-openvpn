resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.env}-vpc"
  }
}

# data "aws_availability_zones" "available" {} //can do this if we dont hardcode the az please suggest

resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_1a
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                                      = "private-ap-south-1a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_1b
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                                      = "private-ap-south-1b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "private-ap-south-1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_1c
  availability_zone = "ap-south-1c"

  tags = {
    "Name"                                      = "private-ap-south-1c"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_1a
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_1b
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_1c
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-ap-south-1c"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-ap-south-1a.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public"
  }
}
resource "aws_route_table_association" "private-ap-south-1a" {
  subnet_id      = aws_subnet.private-ap-south-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-south-1b" {
  subnet_id      = aws_subnet.private-ap-south-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-south-1c" {
  subnet_id      = aws_subnet.private-ap-south-1c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-ap-south-1a" {
  subnet_id      = aws_subnet.public-ap-south-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-south-1b" {
  subnet_id      = aws_subnet.public-ap-south-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-south-1c" {
  subnet_id      = aws_subnet.public-ap-south-1c.id
  route_table_id = aws_route_table.public.id
}
