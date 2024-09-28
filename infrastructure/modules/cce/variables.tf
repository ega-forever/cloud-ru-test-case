variable "account_id" {
  type        = string
  description = "account id"
}

variable "project_id" {
  type        = string
  description = "project id"
}

variable "name" {
  type        = string
  default     = "cce-cluster-showcase"
  description = "name of CCE cluster"
}

variable "flavor_id" {
  type        = string
  default     = "cce.s2.small"
  description = "cluster max size"
}

variable "vpc_id" {
  type = string
}

variable "vpc_subnet_for_dns_id" {
  type = string
}

variable "vpc_eni_subnet_id" {
  type = list(string)
}

variable "service_network_cidr" {
  type    = string
  default = "10.247.0.0/16"
}

variable "node_pool_os" {
  type        = string
  default     = "HCE OS 2.0"
  description = "OS of node in CCE cluster"
}

variable "node_pool_flavor_id" {
  type        = string
  default     = "c7n.2xlarge.4"
  description = "node size"
}

variable "node_pool_initial_node_count" {
  type        = number
  default     = 1
  description = "node pool initial node count"
}

variable "node_pool_min_node_count" {
  type        = number
  default     = 1
  description = "node pool min node count"
}

variable "node_pool_max_node_count" {
  type        = number
  default     = 3
  description = "node pool max node count"
}

variable "node_pool_scale_down_cooldown_time_minutes" {
  type        = number
  default     = 10
  description = "node pool scale down in minutes"
}

variable "node_pool_root_volume_size" {
  type        = number
  default     = 50
  description = "node pool root volume size in GB"
}

variable "node_pool_data_volume_size" {
  type        = number
  default     = 100
  description = "node pool data volume size in GB"
}

variable "addons" {
  type    = map(string)
  default = {
    "autoscaler" : "1.29.17",
    "cce-hpa-controller" : "1.4.3",
    "coredns" : "1.29.4",
    "metrics-server": "1.3.60"
  }
  description = "addons to be installed"
}

variable "tags" {
  type        = map(string)
  description = "tags to mark cluster resources"
  default     = {}
}