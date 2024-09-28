resource "sbercloud_vpc_eip" "elb_eip" {
  name = "${var.deployment_name}-eip"
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

resource "sbercloud_elb_loadbalancer" "elb" {
  enterprise_project_id = var.project_id
  name                  = "${var.deployment_name}-elb"
  cross_vpc_backend     = true
  vpc_id         = var.vpc_id
  ipv4_subnet_id = var.vpc_ipv4_subnet_id
  availability_zone = var.elb_availability_zones
  ipv4_eip_id = sbercloud_vpc_eip.elb_eip.id
}
