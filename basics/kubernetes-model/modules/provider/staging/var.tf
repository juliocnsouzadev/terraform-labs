variable "kubernetes_host" {
  default = "https://ip:port"
}

variable "client_certificate" {
  default = "string"
}

variable "client_key" {
  default = "string"
}

variable "cluster_ca_certificate" {
  default = "string"
}

variable "ingress_name" {
  default = "gateway"
}

variable "ingress_annotations" {
  default = "nginx.ingress.kubernetes.io/rewrite-target: /"
}
