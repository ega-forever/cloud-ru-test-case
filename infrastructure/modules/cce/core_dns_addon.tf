locals {
  coredns_addon_name = "coredns"
}

resource "sbercloud_cce_addon" "core-dns" {
  count         = lookup(var.addons, local.coredns_addon_name, null) == null ? 0 : 1
  cluster_id    = sbercloud_cce_cluster.cce_cluster.id
  template_name = local.coredns_addon_name
  version       = var.addons.coredns

  depends_on = [
    sbercloud_cce_node_pool.cce_cluster_node_pool
  ]
}