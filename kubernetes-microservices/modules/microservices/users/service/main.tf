resource "kubernetes_service" "service" {
  apiVersion = "v1"
  kind       = "Service"
  metadata {
    labels {
      app = var.app
    }
    name      = var.app
    namespace = var.namespace
  }
  spec {
    port {
      port        = var.port
      protocol    = "TCP"
      target_port = var.port
    }
    selector {
      app = var.app
    }
    session_affinity = "None"
    type             = var.service_type
  }
}
