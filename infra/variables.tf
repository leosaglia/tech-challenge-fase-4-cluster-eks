variable "aws_region" {
  default = "us-east-1"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  default     = "tech-challenge-cluster"  
}

variable "eks_version" {
  description = "The desired Kubernetes version for the EKS cluster"
  default     = "1.32"
  
}

variable "eks_role_arn" {
  description = "The name of the IAM role to create for EKS"
  default     = "arn:aws:iam::835311494914:role/LabRole"
}

variable "node_group_role_arn" {
  description = "The name of the IAM role to create for the EKS node group"
  default     = "arn:aws:iam::835311494914:role/LabRole"
}
