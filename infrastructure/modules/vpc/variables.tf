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

variable "primary_dns" {
  type        = string
  default = "100.125.13.59"
  description = "primary dns ip address"
}

variable "secondary_dns" {
  type        = string
  default = "8.8.8.8"
  description = "primary dns ip address"
}

variable "subnets_count" {
  type        = number
  description = "how much private and private subnets to create per each AZ"
}

variable "availability_zone" {
  type        = string
  description = "AZ where subnets will be located"
}

variable "tags" {
  type        = map(string)
  description = "tags to mark all related resources"
  default = {}
}