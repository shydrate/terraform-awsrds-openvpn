output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnets_1a" {
  value = aws_subnet.public-ap-south-1a.id
}

output "public_subnets_1b" {
  value = aws_subnet.public-ap-south-1b.id
}

output "public_subnets_1c" {
  value = aws_subnet.public-ap-south-1c.id
}

output "private_subnets_1a" {
  value = aws_subnet.private-ap-south-1a.id
}

output "private_subnets_1b" {
  value = aws_subnet.private-ap-south-1b.id
}

output "private_subnets_1c" {
  value = aws_subnet.private-ap-south-1c.id
}

output "eip_customer_owned_ip" {
  value = aws_eip.nat.customer_owned_ip
}

output "eip_carrier_ip" {
  value = aws_eip.nat.carrier_ip
}

output "eip_domain" {
  value = aws_eip.nat.domain
}

output "eip_private_dns" {
  value = aws_eip.nat.private_dns
}
output "eip_private_ip" {
  value = aws_eip.nat.private_ip
}
output "eip_public_dns" {
  value = aws_eip.nat.public_dns
}
output "eip_public_ip" {
  value = aws_eip.nat.public_ip
}