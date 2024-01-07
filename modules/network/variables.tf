# vpc.tf
variable name_prefix {
  type        = string
  default     = "my"
  description = "Name prefix for resources created in this module"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable subnet_cidr_1 {
  type        = string
  default     = "10.0.0.0/20"
  description = "subnet 1 CIDR block"
}
variable subnet_az_1 {
  type        = string
  default     = "eu-central-1a"
  description = "availability zone for subnet 1"
}


variable subnet_cidr_2 {
  type        = string
  default     = "10.0.16.0/20"
  description = "subnet 2 CIDR block"
}
variable subnet_az_2 {
  type        = string
  default     = "eu-central-1b"
  description = "availability zone for subnet 2"
}