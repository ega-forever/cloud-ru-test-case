resource "random_password" "wp_password" {
  length  = 16
  special = false
}

locals {
  wp_username = "user"
  wp_password = random_password.wp_password.result
}

resource "helm_release" "wordpress_ha" {
  name       = var.deployment_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version    = "23.1.12"
  values     = [
    "${templatefile(join("", [path.module, "/wp_values.tmpl"]), {
        elb_id = sbercloud_elb_loadbalancer.elb.id
        wp_username = local.wp_username
        wp_password = local.wp_password
    })}"
  ]

  depends_on = [
    sbercloud_elb_loadbalancer.elb
  ]
}