variable "environment" {
  type        = string
  description = "Environment (prod, stage, dev)"
}

variable "terraform" {
  type        = string
  description = "Resource created with terraform"
  default     = "True"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "Public subnet CIDR block"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "Private subnet CIDR block"
}

variable "domain" {
  type        = string
  description = "Domain Name"
}