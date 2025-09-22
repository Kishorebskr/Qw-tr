variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "tc-eks-cluster-tf"
}
