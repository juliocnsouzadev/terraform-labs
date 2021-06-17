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

variable "docker-image" {
  default = "in28min/currency-exchange:0.0.1-RELEASE"
}

variable "service_type" {
  default = "NodePort"
}


