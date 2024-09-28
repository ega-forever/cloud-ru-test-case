output "vpc_id" {
  value = sbercloud_vpc.vpc.id
}

output "vpc_subnets_id" {
  value = sbercloud_vpc_subnet.subnet[*].id
}

output "vpc_subnets_cidr" {
  value = sbercloud_vpc_subnet.subnet[*].cidr
}

output "vpc_subnets_ipv4_subnet_id" {
  value = sbercloud_vpc_subnet.subnet[*].ipv4_subnet_id
}

output "vpc_cidr_block" {
  value = sbercloud_vpc.vpc.cidr
}

output "vpc_az" {
  value = var.availability_zone
}