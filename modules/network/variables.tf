# vpc.tf
variable name_prefix {
  type        = string
  default     = "my"
  description = "Name prefix for resources created in this module"
}

variable vpc_cidr {
  type        = string
  description = "VPC CIDR block"
}

variable subnet_count {
  description = "Number of subnets to create"
  type        = number
}

variable subnet_cidr_offset {
  description = "CIDR offset for creating subnets"
  type        = number
}

variable map_public_ip_on_launch {
  type        = bool
  description = "Map public IPs on instances, subnet option"
}
