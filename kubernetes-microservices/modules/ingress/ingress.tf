resource "kubernetes_ingress" "ingress-gateway" {
  metadata {
    name        = var.ingress_name
    annotations = var.ingress_annotations
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "MyApp1"
            service_port = 8080
          }

          path = "/app1/*"
        }

        path {
          backend {
            service_name = "MyApp2"
            service_port = 8080
          }

          path = "/app2/*"
        }
      }
    }
  }
}
