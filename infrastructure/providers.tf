terraform {
  required_providers {
    sbercloud = {
      source  = "sbercloud-terraform/sbercloud" # Initialize Advanced provider
    }
  }
}

provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3" # Authorization address
  region   = var.region

  # Authorization keys
  access_key = var.access_key
  secret_key = var.secret_key
}