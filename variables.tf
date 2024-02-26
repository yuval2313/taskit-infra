# providers.tf
variable profile {
  type        = string
  default     = "default"
  description = "local configuration and credential profile"
}
variable region {
  type        = string
  default     = "eu-central-1"
  description = "region to apply in"
}


variable owner_tag {
  type        = string
  description = "owner"
}
variable bootcamp_tag {
  type        = number
  description = "bootcamp number"
}
variable expiration_date_tag {
  type        = string
  description = "expiration_date tag"
}

# main.tf #
variable name_prefix {
  type        = string
  description = "Name prefix for created resources"
}

# network
variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}
variable subnet_count {
  description = "Number of subnets to create"
  default     = 2
  type        = number
}
variable subnet_cidr_offset {
  description = "CIDR mask for subnets"
  type        = number
  default     = 4
}
variable map_public_ip_on_launch {
  type        = bool
  default     = true
  description = "Map public IPs on instances, subnet option"
}

# eks
variable instance_type {
  type = string
  default = "t3a.medium"
  description = "Instance type for the EKS cluster"
}
variable desired_size {
  type = number
  default = 3
  description = "Desired node group scaling size for EKS cluster"
}
variable max_size {
  type = number
  default = 3
  description = "Maximum node group scaling size for EKS cluster"
}
variable min_size {
  type = number
  default = 3
  description = "Minimum node group scaling size for EKS cluster"
}

# k8s 
variable apply_k8s_module {
  type        = bool
  default     = false
  description = "Conditionally apply K8s in the cluster"
}
