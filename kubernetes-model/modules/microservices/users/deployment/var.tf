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

variable "min_ready_seconds" {
  default = 45
}

variable "replicas" {
  default = 1
}

variable "max_surge" {
  default = "25%"
}

variable "max_unavailable" {
  default = "25%"
}

variable "rolling_uppdate_type" {
  default = "RollingUpdate"
}

variable "image_pull_policy" {
  default = "IfNotPresent"
}

variable "docker_image" {
  default = "juliocnsouza/microservice:0.0.1"
}

variable "service_type" {
  default = "NodePort"
}


