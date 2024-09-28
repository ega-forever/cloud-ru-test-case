locals {
  hpa_addon_name = "cce-hpa-controller"
}

resource "sbercloud_cce_addon" "cce-hpa-controller" {
  count         = lookup(var.addons, local.hpa_addon_name, null) == null ? 0 : 1
  cluster_id    = sbercloud_cce_cluster.cce_cluster.id
  template_name = local.hpa_addon_name
  version       = var.addons.cce-hpa-controller

  depends_on = [
    sbercloud_cce_node_pool.cce_cluster_node_pool
  ]
}