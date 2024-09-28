/* Account zone */
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

variable "account_id" {
  type = string
  description = "Account id can be checked out in My credentials page on portal (Project ID)"
}

/* end Account zone */

/* Enterprise project zone */

variable "environment_prefix" {
  type        = string
  description = "all resources will have this prefix"
  default     = "dev"
}

variable "enterprise_project_id" {
  type        = string
  description = "enterprise_project_id"
  default     = null
}

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

variable "vpc_subnet_zones_allocation_number" {
  type        = number
  description = "How much AZ use for subnet allocation"
  default     = 1
}

variable "vpc_subnets_count" {
  type        = number
  description = "How many subnets should be created in VPC"
  default     = 1
}

/* end VPC zone */


/* CCE zone */
variable "cce_name" {
  type        = string
  default     = "cce-cluster-showcase"
  description = "name of CCE cluster"
}

variable "cce_flavor_id" {
  type        = string
  default     = "cce.s2.small"
  description = "CCE cluster max size"
}


variable "cce_node_pool_os" {
  type        = string
  default     = "HCE OS 2.0"
  description = "OS of node in CCE cluster"
}

variable "cce_node_pool_flavor_id" {
  type        = string
  default     = "c7n.2xlarge.4"
  description = "node size"
}

variable "cce_node_pool_initial_node_count" {
  type        = number
  default     = 1
  description = "node pool initial node count"
}

variable "cce_node_pool_min_node_count" {
  type        = number
  default     = 1
  description = "node pool min node count"
}

variable "cce_node_pool_max_node_count" {
  type        = number
  default     = 3
  description = "node pool max node count"
}

variable "cce_node_pool_scale_down_cooldown_time_minutes" {
  type        = number
  default     = 10
  description = "node pool scale down in minutes"
}

variable "cce_node_pool_root_volume_size" {
  type        = number
  default     = 50
  description = "node pool root volume size in GB"
}

variable "cce_node_pool_data_volume_size" {
  type        = number
  default     = 100
  description = "node pool data volume size in GB"
}

/* end CEE zone */