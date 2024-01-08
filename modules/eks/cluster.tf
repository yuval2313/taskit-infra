resource "aws_eks_cluster" "cluster" {
  name     = "${var.name_prefix}-cluster"
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = [var.subnet_id_1, var.subnet_id_2]
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "${var.name_prefix}-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids = [var.subnet_id_1, var.subnet_id_2]

  ami_type = var.node_group_ami_type
  disk_size = var.node_group_disk_size
  instance_types = var.node_group_instance_types

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  update_config {
    max_unavailable = var.node_group_max_unavailable
  }
}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "aws-ebs-csi-driver"

  depends_on = [aws_eks_node_group.node_group]
}
resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "kube-proxy"

  depends_on = [aws_eks_node_group.node_group]
}
resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "coredns"

  depends_on = [aws_eks_node_group.node_group]
}
resource "aws_eks_addon" "vpc-cni" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "vpc-cni"

  depends_on = [aws_eks_node_group.node_group]
}