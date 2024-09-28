terraform {
  required_providers {
    sbercloud = {
      source  = "sbercloud-terraform/sbercloud"
    }
  }
}

provider "helm" {
  kubernetes {
    host     = "https://${var.cluster_host}:5443"
    client_certificate     = base64decode(var.cluster_client_certificate)
   client_key             = base64decode(var.cluster_client_key)
    cluster_ca_certificate = base64decode(var.cluster_cluster_ca_certificate)
  }
}