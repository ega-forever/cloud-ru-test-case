data "sbercloud_availability_zones" "zones" {
  state = "available"
}

module "enterprise_project" {
  source      = "./modules/enterprise_project"
  name        = var.enterprise_project_name
  description = var.enterprise_project_description
}


module "vpc" {
  source                = "./modules/vpc"
  vpc_name              = "${var.environment_prefix}-${var.vpc_name}"
  project_id            = module.enterprise_project.project_id
  cidr_block            = var.vpc_cidr_block
  subnets_per_each_zone = var.vpc_subnet_per_each_zones_count
  availability_zones    = data.sbercloud_availability_zones.zones.names
  tags                  = {
    environment : var.environment_prefix
  }
  /*  public_subnet_tags = {
      "kubernetes.io/role/elb": 1
    }*/
  depends_on = [
    module.enterprise_project.project_id
  ]
}

/*
data "aws_availability_zones" "available" {
  state = "available"
}

module "eks" {
  source                     = "./modules/eks"
  cluster_name               = "${var.environment_prefix}-${var.eks_cluster_name}"
  cluster_version            = var.eks_cluster_version
  subnet_ids                 = module.vpc.vpc_public_subnets_id
  security_group_cidr_blocks = [var.resources_allocation_cidr_block]

  vpc_id = module.vpc.vpc_id

  node_group_min_size       = var.eks_node_group_min_size
  node_group_max_size       = var.eks_node_group_max_size
  node_group_desired_size   = var.eks_node_group_desired_size
  node_group_instance_type  = var.eks_node_group_instance_type
  cluster_service_ipv4_cidr = var.eks_cluster_service_ipv4_cidr
  tags                      = {
    environment : var.environment_prefix
  }
}

module "pg_db" {
  source                     = "./modules/pg_rds"
  db_name                    = "${var.environment_prefix}${var.db_name}"
  engine_version             = var.db_engine_version
  instance_type             = var.db_instance_type
  storage_size               = var.db_storage_size
  max_storage_size           = var.db_max_storage_size
  vpc_id                     = module.vpc.vpc_id
  security_group_cidr_blocks = [var.resources_allocation_cidr_block]
  subnet_ids                 = module.vpc.vpc_private_subnets_id

  tags = {
    environment : var.environment_prefix
  }
}

module "msk" {
  source          = "./modules/msk"
  cluster_name    = "${var.environment_prefix}-${var.msk_name}"
  cluster_version = var.msk_version
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.vpc.vpc_private_subnets_id
  security_group_cidr_blocks = [var.resources_allocation_cidr_block]

  cluster_size          = length(module.vpc.vpc_private_subnets_id) * 2
  cluster_storage_size  = var.msk_storage_size
  cluster_instance_type = var.msk_instance_type
  tags                  = {
    environment : var.environment_prefix
  }
}

module "ecr" {
  source          = "./modules/ecr"
  repo_names = [
    "backend.services.counter"
  ]
  tags                  = {
    environment : var.environment_prefix
  }
}

module "client_vpn" {
  for_each = var.vpn_client_profile_names
  source               = "./modules/client_vpn"
  vpn_name             = "${var.environment_prefix}-${var.vpn_client_name}-${each.value}"
  client_cidr_block    = var.vpn_client_cidr_block
  network_cidr_block   = var.resources_allocation_cidr_block
  vpc_id               = module.vpc.vpc_id
  subnets_id           = module.vpc.vpc_private_subnets_id
  client_profile_name = each.value
  key_export_folder    = var.vpn_client_key_export_folder
  tags                  = {
    environment : var.environment_prefix
  }
}

module "redis" { //todo move to single cluster
  source          = "./modules/redis"
  cluster_name    = "${var.environment_prefix}-${var.redis_name}"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.vpc_private_subnets_id
  security_group_cidr_blocks = ["10.0.0.0/8"] //todo
  cluster_instance_type = "cache.m4.large" // todo
  cluster_family = "redis6.x" // todo
  cluster_engine_version = "6.x" //todo
  cluster_replicas_per_node_group = 2 //todo
  cluster_num_node_groups = 3 //todo
  tags                  = {
    environment : var.environment_prefix
  }
}
*/


/*

module "vpn" {
  source               = "./vpn"
  aws_vpc_id           = module.aws_vpc.vpc_id
  aws_route_table_ids  = [module.aws_vpc.private_route_table_id, module.aws_vpc.public_route_table_id]
  gcp_region           = var.google_region
  gcp_vpc_id           = module.gcp_vpc.vpc_id
  gcp_vpc_name         = module.gcp_vpc.vpc_name
  gcp_subnet_self_link = module.gcp_vpc.vpc_private_subnet_self_link
  gcp_vpn_name         = "vpn-connection"
}
*/
