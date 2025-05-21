data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
  depends_on = [aws_eks_cluster.eks]
}

data "aws_eks_cluster_auth" "eks" {
  name = var.eks_cluster_name
  depends_on = [aws_eks_cluster.eks]
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
    config_path            = "~/.kube/config"
  }
}