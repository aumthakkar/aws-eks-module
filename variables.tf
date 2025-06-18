
# === root/variables.tf === 

variable "access_ips" {}
variable "vpc_cidr" {}
variable "aws_region" {}


variable "org_name" {}
variable "env_name" {}

variable "auto_create_subnet_address" {
  type = bool
  description = "To get decision about auto creating subnet cidr addresses"
}

