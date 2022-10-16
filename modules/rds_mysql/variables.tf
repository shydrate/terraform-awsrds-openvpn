variable "db_name" {
  type        = string
  description = "Name of the database"
}

variable "instance_class" {
  type        = string
  description = "Instance type"
}

variable "identifier_name" {
  type        = string
  description = "Name of the identifier"
}

variable "db_username" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "allocated_storage" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "parameters" {
  type = list(map(string))
}

variable "publicly_accessible" {
  type = string
  default = "false"
}