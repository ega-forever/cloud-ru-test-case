variable "region" {
  type        = string
  description = "aws region to use"
  default     = "ru-moscow-1"
}

variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

variable "environment_prefix" {
  type        = string
  description = "all resources will have this prefix"
  default     = "dev"
}

/* Enterprise project zone */

variable "enterprise_project_name" {
  type        = string
  default     = "showcase-project"
  description = "name for the enterprise project"
}

variable "enterprise_project_description" {
  type        = string
  default     = ""
  description = "description of the enterprise project"
}

/* end Enterprise project zone */

/* VPC zone */

variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "vpc"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC network segment in CIDR notation"
  default     = "192.168.0.0/16"
}

variable "vpc_default_gateway" {
  type        = string
  description = "VPC default gateway for the specified CIDR block"
  default     = "192.168.0.1"
}

variable "vpc_primary_dns" {
  type        = string
  default     = "100.125.13.59"
  description = "primary dns ip address"
}

variable "vpc_secondary_dns" {
  type        = string
  default     = "100.125.65.14"
  description = "primary dns ip address"
}

variable "vpc_subnet_per_each_zones_count" {
  type        = number
  description = "How much public and private subnets should be created in each AZ"
  default     = 1
}

/* end VPC zone */
/*
variable "resources_allocation_cidr_block" {
  type        = string
  description = "in which network all resources, including VPC and VPN users will reside"
  default = "10.0.0.0/8"
}


variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "eks_cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.21`), omit to use default latest"
  type        = string
  default     = "1.21"
}

variable "eks_cluster_service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
  type        = string
  default = "10.2.0.0/16"
}

variable "eks_node_group_min_size" {
  description = "Minimal size of EKS cluster"
  type        = number
  default     = 1
}

variable "eks_node_group_max_size" {
  description = "Max size of EKS cluster"
  type        = number
  default     = 3
}

variable "eks_node_group_desired_size" {
  description = "Desired size of EKS cluster"
  type        = number
  default     = 1
}

variable "eks_node_group_instance_type" {
  description = "EC2 instance type of EKS node group in cluster"
  type        = string
  default     = "t2.medium"
}

variable "db_name" {
  type        = string
  description = "Name of RDS postgres instance"
  default = "db"
}

variable "db_engine_version" {
  type        = string
  description = "used engine version for db"
  default = "13.5"
}

variable "db_instance_type" {
  type        = string
  description = "instance resources type"
  default = "db.t3.medium"
}

variable "db_storage_size" {
  type        = number
  description = "db storage size in GB"
  default = 10
}

variable "db_max_storage_size" {
  type        = number
  description = "autoscale max db storage size in GB"
  default = 100
}


variable "msk_name" {
  type        = string
  description = "Name of MSK instance"
  default = "msk-cluster"
}

variable "msk_version" {
  type        = string
  description = "MSK version"
  default = "2.6.2"
}

variable "msk_instance_type" {
  type        = string
  description = "instance resources class"
  default = "kafka.t3.small"
}

variable "msk_storage_size" {
  type        = number
  description = "MSK storage size in GB"
  default = 50
}

variable "vpn_client_name" {
  description = "Name of the vpn endpoint"
  type        = string
  default = "vpn-endpoint"
}


variable "vpn_client_cidr_block" {
  description = "The IPv4 address range, in CIDR notation being /22 or greater, from which to assign client IP addresses"
  type        = string
  default = "10.1.0.0/22"
}

variable "vpn_client_profile_names" {
  description = "client names. For each of them the certificate will be generated"
  type        = set(string)
  default = ["wise.nautilus", "angry.madison"] #test profile names
}

variable "vpn_client_key_export_folder" {
  description = "export folder for the ovpn profiles"
  type        = string
  default = "../ovpn_profiles"
}

variable "redis_name" {
  type        = string
  description = "Name of Redis instance"
  default = "redis-cluster"
}*/
