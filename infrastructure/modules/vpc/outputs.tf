output "vpc_id" {
  value = sbercloud_vpc.vpc.id
}

output "vpc_private_subnets_id" {
  value = sbercloud_vpc_subnet.private[*].id
}

output "vpc_public_subnets_id" {
  value = sbercloud_vpc_subnet.public[*].id
}

output "vpc_cidr_block" {
  value = sbercloud_vpc.vpc.cidr
}

/*output "private_route_table_id" { //todo maybe remove
  value = aws_route_table.private.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}*/
