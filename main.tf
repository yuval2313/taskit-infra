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
  
  # Mandatory
  name_prefix = var.name_prefix
  eks_cluster_role_arn = module.security.eks_cluster_role_arn
  eks_node_role_arn = module.security.eks_node_role_arn
  subnet_id_1 = module.network.subnet_id_1
  subnet_id_2 = module.network.subnet_id_2

  # Optional
  node_group_max_size = 4
}