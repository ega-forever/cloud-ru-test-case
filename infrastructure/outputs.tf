output "cce_cluster_name" {
  description = "cluster name"
  value       = module.cce.cluster_name
}

output "cce_cluster_address" {
  description = "cluster address"
  value       = module.cce.cluster_address
}

output "cluster_node_pool_password" {
  description = "cluster node pool password"
  value       = module.cce.cluster_node_pool_password
  sensitive   = true
}

output "cce_cluster_raw_kube_config" {
  description = "cluster raw kube config"
  value       = module.cce.cluster_raw_kube_config
}

output "cce_cluster_ca_certificates" {
  description = "cluster certificates"
  value       = module.cce.cluster_ca_certificates
}

output "cce_cluster_certificate_users_client_certs" {
  description = "cluster users"
  value       = module.cce.cluster_certificate_users_client_certs
}

output "cce_cluster_certificate_users_client_key_data" {
  description = "cluster users"
  value       = module.cce.cluster_certificate_users_client_key_data
}

output "wordpress_username" {
  description = "wordpress username"
  value       = module.wordpress.wp_username
}

output "wordpress_password" {
  description = "wordpress password"
  value       = module.wordpress.wp_password
  sensitive   = true
}

output "wordpress_site_address" {
  description = "wordpress website address"
  value       = module.wordpress.site_address
}