resource "sbercloud_vpc_eip" "cce_cluster_endpoint_eip" {
  enterprise_project_id = var.project_id
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name = "${var.name}-eip"
    size        = 100
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "sbercloud_cce_cluster" "cce_cluster" {
  enterprise_project_id = var.project_id
  name                   = var.name
  flavor_id              = var.flavor_id
  container_network_type = "eni"
  vpc_id                 = var.vpc_id
  subnet_id              = var.vpc_subnet_for_dns_id
  eni_subnet_id          = join(",", var.vpc_eni_subnet_id)
  service_network_cidr   = var.service_network_cidr
  authentication_mode    = "rbac"
  eip                    = sbercloud_vpc_eip.cce_cluster_endpoint_eip.address


  multi_az               = true
  tags                   = var.tags
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "sbercloud_cce_node_pool" "cce_cluster_node_pool" {
  cluster_id               = sbercloud_cce_cluster.cce_cluster.id
  name                     = "${var.name}-node-pool"
  os                       = var.node_pool_os
  initial_node_count       = var.node_pool_initial_node_count
  flavor_id                = var.node_pool_flavor_id
  scall_enable             = true
  min_node_count           = var.node_pool_min_node_count
  max_node_count           = var.node_pool_max_node_count
  scale_down_cooldown_time = var.node_pool_scale_down_cooldown_time_minutes
  password                 = random_password.password.result
  priority                 = 1
  root_volume {
    size       = var.node_pool_root_volume_size
    volumetype = "SAS"
  }
  data_volumes {
    size       = var.node_pool_data_volume_size
    volumetype = "SAS"
  }
  tags = var.tags
}