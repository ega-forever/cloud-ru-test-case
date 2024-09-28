variable "project_id" {
  type    = string
}

variable "deployment_name" {
  type    = string
  default = "wordpress"
}

variable "vpc_id" {
  type    = string
}

variable "vpc_ipv4_subnet_id" {
  type = string
}

variable "vpc_subnet_id" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "elb_availability_zones" {
  type    = list(string)
}

variable "cluster_host" {
  type        = string
  description = "k8s host"
}

variable "cluster_client_certificate" {
  type        = string
  description = "k8s client_certificate"
}

variable "cluster_client_key" {
  type        = string
  description = "k8s client_key"
}

variable "cluster_cluster_ca_certificate" {
  type        = string
  description = "k8s cluster_ca_certificate"
}

variable "cluster_node_pool_nodes_count" {
  type = string
}