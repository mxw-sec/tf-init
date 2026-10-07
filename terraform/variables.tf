variable "aws_region" {
  description = "Region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name, used as a prefix for resource names"
  type        = string
  default     = "inventory-sync"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC the instance and security group are created in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet the instance is launched into"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Optional EC2 key pair name"
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Root volume size in GiB"
  type        = number
  default     = 30
}

variable "admin_cidr_block" {
  description = "CIDR block permitted to administer the instance"
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_api_key" {
  description = "API key used by the sync service to talk to the upstream inventory provider"
  type        = string
  default     = "svc_8f3a91c2e7d4405b9a6e1f0c2d7b3a58"
}

variable "tags" {
  description = "Additional tags applied to all resources"
  type        = map(string)
  default     = {}
}
