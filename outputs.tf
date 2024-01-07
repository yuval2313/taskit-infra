output "cluster_kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
  description = "AWS CLI command for configuring cluster with kubectl"
}