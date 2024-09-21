/*
output "region" {
  description = "The region where resources deployed"
  value       = var.aws_region
}

output "eks_cluster_endpoint" {
  description = "The EKS endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.eks.cluster_arn
}

output "eks_cluster_name" {
  description = "The EKS name"
  value       = module.eks.cluster_name
}

output "eks_cluster_ca_certificate" {
  description = "The EKS certificate"
  value       = module.eks.cluster_ca_certificate
}

output "eks_role_arn" {
  description = "The EKS role ARN"
  value       = module.eks.cluster_role_arn
}

output "eks_cloudwatch_log_group_name" {
  description = "The cloudWatch log group for EKS"
  value       = module.eks.cluster_cloudwatch_log_group_name
}

output "msk_bootstrap_servers" {
  description = "MSK bootstrap servers list"
  value       = module.msk.bootstrap_brokers
}

output "msk_zookeeper" {
  description = "MSK zookeeper address"
  value       = module.msk.zookeeper_connect_string
}

output "pg_rds_db_username" {
  description = "RDS DB instance username"
  value = module.pg_db.db_username
}

output "pg_rds_db_password" {
  description = "RDS DB instance password"
  value = module.pg_db.db_password
}

output "pg_rds_db_private_address" {
  description = "RDS DB instance address"
  value = module.pg_db.db_private_address
}

output "pg_rds_db_private_port" {
  description = "RDS DB instance port"
  value = module.pg_db.db_private_port
}

output "ecr_repos" {
  description = "ecr repos"
  value = module.ecr.repos
}

output "redis_cluster_endpoint" {
  description = "redis cluster endpoint"
  value = module.redis.cluster_endpoint
}*/
