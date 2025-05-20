resource "aws_eks_cluster" "eks" {
    name     = var.eks_cluster_name
    version  = var.eks_version
    role_arn = var.eks_role_arn

    vpc_config {
        endpoint_public_access  = true
        endpoint_private_access = false
        subnet_ids              = [for id in data.aws_subnets.private_subnets.ids : id]
    }
}

resource "aws_security_group_rule" "allow_app_to_rds" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = data.aws_security_group.rds_security_group.id
  source_security_group_id = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}