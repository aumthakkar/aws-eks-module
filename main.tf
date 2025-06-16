
module "eks_cluster" {
  source = "./eks"

  name_prefix = local.name
  aws_region  = var.aws_region

  # networking related values

  vpc_cidr = var.vpc_cidr

  public_subnet_count = 2
  public_subnet_cidr  = local.public_subnet_cidr

  private_subnet_count = 2
  private_subnet_cidr  = local.private_subnet_cidr

  cluster_security_groups = local.cluster_security_groups

  # eks-cluster related values
  cluster_name        = "${local.name}-eksdemo"
  eks_cluster_version = "1.32"

  cluster_service_ipv4_cidr            = "172.20.0.0/16"
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  public_subnets  = module.eks_cluster.public_subnets
  private_subnets = module.eks_cluster.private_subnets

  eks_public_nodegroup_name           = "${local.name}-public-nodegroup"
  public_nodegroup_desired_size       = 1
  public_nodegroup_max_size           = 2
  public_nodegroup_min_size           = 1
  public_nodegroup_max_unavail_pctage = 50

  public_nodegroup_ami_type       = "AL2_x86_64"
  public_nodegroup_capacity_type  = "SPOT"
  public_nodegroup_disk_size      = 20
  public_nodegroup_instance_types = ["t3.large"]


  eks_private_nodegroup_name           = "${local.name}-private-nodegroup"
  private_nodegroup_desired_size       = 1
  private_nodegroup_max_size           = 2
  private_nodegroup_min_size           = 1
  private_nodegroup_max_unavail_pctage = 50

  private_nodegroup_ami_type       = "AL2_x86_64"
  private_nodegroup_capacity_type  = "SPOT"
  private_nodegroup_disk_size      = 20
  private_nodegroup_instance_types = ["t3.large"]

}




