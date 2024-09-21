resource "sbercloud_vpc" "vpc" {
  name = var.vpc_name
  cidr = var.cidr_block
  enterprise_project_id = var.project_id
}

resource "sbercloud_vpc_subnet" "private" {
  count             = length(var.availability_zones) * var.subnets_per_each_zone
  name              = "${var.vpc_name}-private_subnet-${count.index}"
  vpc_id            = sbercloud_vpc.vpc.id
  availability_zone = var.availability_zones[floor(count.index / var.subnets_per_each_zone)]
  cidr              = cidrsubnet(var.cidr_block, 4, count.index)
  gateway_ip        = var.gateway_ip
  primary_dns       = var.primary_dns
  secondary_dns     = var.secondary_dns

  tags = merge({
    Name = "${var.vpc_name}-private-subnet-${count.index}"
  }, var.tags, var.private_subnet_tags)
}

resource "sbercloud_vpc_subnet" "public" {
  count             = length(var.availability_zones) * var.subnets_per_each_zone
  name              = "${var.vpc_name}-private_subnet-${count.index}"
  vpc_id            = sbercloud_vpc.vpc.id
  availability_zone = var.availability_zones[floor(count.index / var.subnets_per_each_zone)]
  cidr              = cidrsubnet(var.cidr_block, 4, count.index + 1 + length(var.availability_zones) * var.subnets_per_each_zone)
  gateway_ip        = var.gateway_ip
  primary_dns       = var.primary_dns
  secondary_dns     = var.secondary_dns

  tags = merge({
    Name = "${var.vpc_name}-private-subnet-${count.index}"
  }, var.tags, var.private_subnet_tags)
}

/* todo may be remove
resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.public[*].id

  ingress {
    protocol   = "tcp"
    rule_no    = 10
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }


  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "udp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = aws_vpc.main.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge({
    Name = "${var.vpc_name}-public-acl"
  }, var.tags)
}

resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private[*].id

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "udp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = aws_vpc.main.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge({
    Name = "${var.vpc_name}-private-acl"
  }, var.tags)
}

# Gateways

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${var.vpc_name}-internet-gateway"
  }, var.tags)
}

resource "aws_eip" "nat" {
  vpc = true

  tags = merge({
    Name = "${var.vpc_name}-nat-elastic-ip"
  }, var.tags)

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge({
    Name = "${var.vpc_name}-nat-gateway"
  }, var.tags)

  depends_on = [aws_internet_gateway.gw]
}

# Route Tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${var.vpc_name}-public-route-table"
  }, var.tags)
}

resource "aws_route" "public_igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${var.vpc_name}-private-route-table"
  }, var.tags)
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gw.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
*/
