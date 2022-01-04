provider "kubernetes" {
  host = var.kubernetes_host
  client_certificate     = base64decode(var.client_certificate)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}
