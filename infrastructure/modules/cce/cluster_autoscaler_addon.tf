locals {
  autoscale_addon_name = "autoscaler"
}

data "sbercloud_cce_addon_template" "autoscaler" {
  count = lookup(var.addons, local.autoscale_addon_name, null) == null ? 0 : 1
  cluster_id = sbercloud_cce_cluster.cce_cluster.id
  name       = local.autoscale_addon_name
  version    = var.addons.autoscaler
}

resource "sbercloud_cce_addon" "autoscaler" {
  count = lookup(var.addons, local.autoscale_addon_name, null) == null ? 0 : 1
  cluster_id    = sbercloud_cce_cluster.cce_cluster.id
  template_name = local.autoscale_addon_name
  version = var.addons.autoscaler
  values {
    basic_json  = jsonencode(jsondecode(data.sbercloud_cce_addon_template.autoscaler[0].spec).basic)
    custom_json = jsonencode(merge(
      jsondecode(data.sbercloud_cce_addon_template.autoscaler[0].spec).parameters.custom,
      {
        cluster_id = sbercloud_cce_cluster.cce_cluster.id
        tenant_id  = var.account_id
      }
    ))
  }

  depends_on = [
    sbercloud_cce_node_pool.cce_cluster_node_pool
  ]
}