variable "ami" {
  type = string
  default = "ami-0851b76e8b1bce90b"
}

variable "key_name" {
  type = string
  default = "macbook_pro_personal"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "openvpn-sgp" {
  type = string
  default = "openvpn-security-group"
}