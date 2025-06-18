locals {
  public_subnet_cidr  = [for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  private_subnet_cidr = [for i in range(1, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

locals {
  public_subnet_cidr_block  = var.auto_create_subnet_address ? local.public_subnet_cidr : var.public_subnet_cidr_addresses
  private_subnet_cidr_block = var.auto_create_subnet_address ? local.private_subnet_cidr : var.private_subnet_cidr_addresses
}