output "cluster_name" {
  description = "cluster name"
  value       = sbercloud_cce_cluster.cce_cluster.name
}

output "cluster_address" {
  description = "cluster address"
  value       = sbercloud_cce_cluster.cce_cluster.eip
}

output "cluster_node_pool_password" {
  description = "cluster node pool password"
  value       = random_password.password.result
}

output "cluster_raw_kube_config" {
  description = "cluster raw kube config"
  value       = sbercloud_cce_cluster.cce_cluster.kube_config_raw
}

output "cluster_ca_certificates" {
  description = "cluster certificates"
  value       = sbercloud_cce_cluster.cce_cluster.certificate_clusters[*].certificate_authority_data
}

output "cluster_certificate_users_client_certs" {
  description = "cluster users"
  value       = sbercloud_cce_cluster.cce_cluster.certificate_users[*].client_certificate_data
}

output "cluster_certificate_users_client_key_data" {
  description = "cluster users"
  value       = sbercloud_cce_cluster.cce_cluster.certificate_users[*].client_key_data
}

output "cluster_node_pool_current_node_count" {
  description = "cluster users"
  value       = sbercloud_cce_node_pool.cce_cluster_node_pool.current_node_count
}