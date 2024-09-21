variable "vpc_name" {
  type        = string
  default = "vpc"
  description = "the name for the vpc"
}

variable "project_id" {
  type        = string
  description = "enterprise project id"
}

variable "cidr_block" {
  type        = string
  default = "192.168.0.0/16"
  description = "the cidr block to use for the vpc"
}

variable "gateway_ip" {
  type        = string
  default = "192.168.0.1"
  description = "gateway ip"
}

variable "primary_dns" {
  type        = string
  default = "100.125.13.59"
  description = "primary dns ip address"
}

variable "secondary_dns" {
  type        = string
  default = "100.125.65.14"
  description = "primary dns ip address"
}

variable "subnets_per_each_zone" {
  type        = number
  description = "how much private and private subnets to create per each AZ"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZs where subnets will be located"
}

variable "tags" {
  type        = map(string)
  description = "tags to mark all related resources"
  default = {}
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "tags to mark public subnets"
  default = {}
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "tags to mark private subnets"
  default = {}
}