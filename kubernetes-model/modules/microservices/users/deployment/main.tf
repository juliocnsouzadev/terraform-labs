resource "kubernetes_deployment" "app-deployment" {
  metadata {
    labels = {
      app = var.app
    }
    name      = var.app
    namespace = var.namespace
  }
  spec {
    min_ready_seconds = var.min_ready_seconds
    replicas          = var.replicas
    selector {
      match_labels = {
        app = var.app
      }
    }
    strategy {
      rolling_update {
        max_surge       = var.max_surge
        max_unavailable = var.max_unavailable
      }
      type = var.rolling_uppdate_type
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        container {
          image             = var.docker_image
          image_pull_policy = var.image_pull_policy
          liveness_probe {
            failure_threshold = 5
            http_get {
              path = "/"
              port = "liveness-port"
            }
            initial_delay_seconds = 60
            period_seconds        = 10
          }
          name = var.app
          port {
            container_port = 8000
            name           = "liveness-port"
          }
          readiness_probe {
            failure_threshold = 5
            http_get {
              path = "/"
              port = "liveness-port"
            }
            initial_delay_seconds = 60
            period_seconds        = 10
          }
          resources {
            limits = {
              cpu    = "500m"
              memory = "1024Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "512Mi"
            }
          }
        }
        restart_policy                   = "Always"
        termination_grace_period_seconds = 30
      }
    }
  }
}

