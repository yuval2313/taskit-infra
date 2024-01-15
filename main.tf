module "network" {
  source = "./modules/network"  

  name_prefix = var.name_prefix
}

module "security" {
  source = "./modules/security"  

  name_prefix = var.name_prefix
}

module "eks" {
  source = "./modules/eks"
  depends_on = [module.security]
  
  name_prefix = var.name_prefix
  eks_cluster_role_arn = module.security.eks_cluster_role_arn
  eks_node_role_arn = module.security.eks_node_role_arn
  subnet_id_1 = module.network.subnet_id_1
  subnet_id_2 = module.network.subnet_id_2

  node_group_instance_type = var.instance_type
  node_group_desired_size = var.desired_size
  node_group_max_size = var.max_size
  node_group_min_size = var.min_size
}

module "k8s" {
  source = "./modules/k8s"
  depends_on = [module.eks]

  count = var.apply_k8s_module ? 1 : 0

  values_path = "${path.module}/k8s-files/argocd-values.yml"
  bootstrap_application_path = "${path.module}/k8s-files/bootstrap-application.yml"
}