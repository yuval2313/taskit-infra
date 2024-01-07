variable name_prefix {
  type        = string
  default     = "my"
  description = "Name prefix for created resources"
}

# Security
variable eks_cluster_role_arn {
  type        = string
  description = "Role ARN for EKS cluster"
}
variable eks_node_role_arn {
  type        = string
  description = "Role ARN for EKS node group"
}

# Network
variable subnet_id_1 {
  type        = string 
  description = "First subnet ID for Cluster"
}
variable subnet_id_2 {
  type        = string 
  description = "Second subnet ID for Cluster"
}

# Node group    
variable node_group_ami_type {
  type        = string
  default     = "AL2_x86_64"
  description = "AMI associated with the EKS node group"
}
variable node_group_disk_size {
  type        = number
  default     = 20
  description = "Disk size in GiB for worker nodes"
}
variable node_group_instance_types {
  type        = list
  default     = ["t3a.medium"]
  description = "List of instance types associated with the EKS node group"
}

variable node_group_desired_size {
  type        = number
  default     = 2
  description = "Desired size in scaling configuration for EKS node group"
}
variable node_group_max_size {
  type        = number
  default     = 2
  description = "Max size in scaling configuration for EKS node group"
}
variable node_group_min_size {
  type        = number
  default     = 2
  description = "Min size in scaling configuration for EKS node group"
}

variable node_group_max_unavailable {
  type        = number
  default     = 1
  description = "Max unavailable in update configuration for EKS node group"
}