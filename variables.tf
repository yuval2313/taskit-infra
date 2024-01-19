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

# main.tf
variable name_prefix {
  type        = string
  description = "Name prefix for created resources"
}
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

# k8s module
variable apply_k8s_module {
  type        = bool
  default     = false
  description = "Conditionally apply K8s in the cluster"
}
