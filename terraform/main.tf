module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["eu-central-1a", "eu-central-1b"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway     = false
  single_nat_gateway     = false
  map_public_ip_on_launch = true   # ✅ This is valid in v5+

  tags = {
    "kubernetes.io/cluster/tc-eks-cluster-tf" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/tc-eks-cluster-tf" = "shared"
  }
}
