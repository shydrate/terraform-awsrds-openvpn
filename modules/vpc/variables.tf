variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"

}

variable "vpc_params" {
  type = map(any)
  default = {
    department = "nsg"
    project    = "common"
  }

}

variable "env" {
  default = "dev"
}

variable "private_subnet_cidr_1a" {
  type    = string
  default = "10.0.0.0/19"
}

variable "private_subnet_cidr_1b" {
  type    = string
  default = "10.0.32.0/19"
}

variable "private_subnet_cidr_1c" {
  type    = string
  default = "10.0.160.0/19"
}

variable "public_subnet_cidr_1a" {
  type    = string
  default = "10.0.64.0/19"
}

variable "public_subnet_cidr_1b" {
  type    = string
  default = "10.0.96.0/19"
}
variable "public_subnet_cidr_1c" {
  type    = string
  default = "10.0.128.0/19"
}

variable "cluster-name" {
  default = "alpha-cluster-dev"
  type    = string
}