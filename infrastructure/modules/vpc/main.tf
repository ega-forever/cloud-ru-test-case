resource "sbercloud_vpc" "vpc" {
  name                  = var.vpc_name
  cidr                  = var.cidr_block
  enterprise_project_id = var.project_id
}

resource "sbercloud_vpc_subnet" "subnet" {
  count             = var.subnets_count
  name              = "${var.vpc_name}-subnet-${count.index}"
  vpc_id            = sbercloud_vpc.vpc.id
  availability_zone = var.availability_zone
  cidr              = cidrsubnet(var.cidr_block, 8, count.index)
  gateway_ip        = cidrhost(cidrsubnet(var.cidr_block, 8, count.index), 1)
  primary_dns       = var.primary_dns
  secondary_dns     = var.secondary_dns

  tags = merge({
    Name = "${var.vpc_name}-subnet-${count.index}"
  }, var.tags)
}

resource "sbercloud_nat_gateway" "subnet_nat" {
  count                 = length(sbercloud_vpc_subnet.subnet)
  name                  = "${var.vpc_name}-${count.index}-ng"
  spec                  = "3"
  enterprise_project_id = var.project_id
  subnet_id             = sbercloud_vpc_subnet.subnet[count.index].id
  vpc_id                = sbercloud_vpc.vpc.id
}

resource "sbercloud_vpc_eip" "subnet_nat_eip" {
  count = length(sbercloud_nat_gateway.subnet_nat)
  name  = "${var.vpc_name}-subnet-${count.index}-nat-eip"
  publicip {
    type       = "5_bgp"
    ip_version = 4
  }
  bandwidth {
    share_type  = "PER"
    name        = "test"
    size        = 10
    charge_mode = "traffic"
  }
}

resource "sbercloud_nat_snat_rule" "subnet_nat_snat_rule" {
  count = length(sbercloud_nat_gateway.subnet_nat)

  nat_gateway_id = sbercloud_nat_gateway.subnet_nat[count.index].id
  subnet_id      = sbercloud_vpc_subnet.subnet[count.index].id
  floating_ip_id = sbercloud_vpc_eip.subnet_nat_eip[count.index].id
}


