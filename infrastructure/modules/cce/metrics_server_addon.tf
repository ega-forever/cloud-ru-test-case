locals {
  metrics_server_addon_name = "metrics-server"
}

resource "sbercloud_cce_addon" "metrics_server" {
  count         = lookup(var.addons, local.metrics_server_addon_name, null) == null ? 0 : 1
  cluster_id    = sbercloud_cce_cluster.cce_cluster.id
  template_name = local.metrics_server_addon_name
  version       = var.addons.metrics-server

  depends_on = [
    sbercloud_cce_node_pool.cce_cluster_node_pool
  ]
}