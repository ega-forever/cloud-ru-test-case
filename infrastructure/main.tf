data "sbercloud_availability_zones" "zones" {
  state = "available"
}

module "enterprise_project" {
  source      = "./modules/enterprise_project"
  name        = var.enterprise_project_name
  description = var.enterprise_project_description
  count       = var.enterprise_project_id == null ? 1 : 0
}


module "vpc" {
  source            = "./modules/vpc"
  vpc_name          = "${var.environment_prefix}-${var.vpc_name}"
  project_id        = var.enterprise_project_id == null ? module.enterprise_project[0].project_id : var.enterprise_project_id
  cidr_block        = var.vpc_cidr_block
  subnets_count     = var.vpc_subnets_count
  availability_zone = sort(data.sbercloud_availability_zones.zones.names)[0]
  tags              = {
    environment : var.environment_prefix
  }
}

module "cce" {
  source                                     = "./modules/cce"
  account_id                                 = var.account_id
  project_id                                 = var.enterprise_project_id == null ? module.enterprise_project[0].project_id : var.enterprise_project_id
  name                                       = var.cce_name
  flavor_id                                  = var.cce_flavor_id
  vpc_id                                     = module.vpc.vpc_id
  vpc_subnet_for_dns_id                      = module.vpc.vpc_subnets_id[0]
  vpc_eni_subnet_id                          = module.vpc.vpc_subnets_ipv4_subnet_id
  node_pool_os                               = var.cce_node_pool_os
  node_pool_flavor_id                        = var.cce_node_pool_flavor_id
  node_pool_initial_node_count               = var.cce_node_pool_initial_node_count
  node_pool_min_node_count                   = var.cce_node_pool_min_node_count
  node_pool_max_node_count                   = var.cce_node_pool_max_node_count
  node_pool_scale_down_cooldown_time_minutes = var.cce_node_pool_scale_down_cooldown_time_minutes
  node_pool_root_volume_size                 = var.cce_node_pool_root_volume_size
  node_pool_data_volume_size                 = var.cce_node_pool_data_volume_size
  addons = {
    "autoscaler" : "1.29.17",
    "cce-hpa-controller" : "1.4.3",
    "metrics-server": "1.3.60"
    #"coredns" : "1.29.4" disabled, since coredns installs automatically during cluster provision
  }
  depends_on                                 = [
    module.vpc
  ]
}

module "wordpress" {
  source                         = "./modules/apps/wordpress"
  cluster_host                   = module.cce.cluster_address
  cluster_client_certificate     = module.cce.cluster_certificate_users_client_certs[0]
  cluster_client_key             = module.cce.cluster_certificate_users_client_key_data[0]
  cluster_cluster_ca_certificate = module.cce.cluster_ca_certificates[0]
  cluster_node_pool_nodes_count  = module.cce.cluster_node_pool_current_node_count

  elb_availability_zones = slice(sort(data.sbercloud_availability_zones.zones.names), 0, 2)
  project_id             = var.enterprise_project_id
  vpc_id                 = module.vpc.vpc_id
  vpc_ipv4_subnet_id     = module.vpc.vpc_subnets_ipv4_subnet_id[0]
  vpc_subnet_id          = module.vpc.vpc_subnets_id[0]
  vpc_cidr_block         = var.vpc_cidr_block
}