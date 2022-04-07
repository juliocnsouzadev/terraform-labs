variable "kubernetes_host" {
  default = "https://ip:port"
}

variable "app" {
  default = "your-app"
}

variable "port" {
  default = "8080"
}

variable "namespace" {
  default = "default"
}

variable "service_type" {
  default = "NodePort"
}


