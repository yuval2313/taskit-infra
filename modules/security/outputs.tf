output eks_cluster_role_arn {
  value       = aws_iam_role.eks_cluster_role.arn
  description = "ARN for EKS Cluster Role"
}

output eks_node_role_arn {
  value       = aws_iam_role.eks_node_role.arn
  description = "ARN for EKS Node Role"
}
