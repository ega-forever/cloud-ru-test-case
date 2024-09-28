output "wp_username" {
  description = "wordpress username"
  value       = local.wp_username
}

output "wp_password" {
  description = "wordpress password"
  value       = local.wp_password
  sensitive   = true
}

output "site_address" {
  description = "website address"
  value       = sbercloud_vpc_eip.elb_eip.address
}