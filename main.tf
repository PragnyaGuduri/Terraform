provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "mongodb" {
  metadata {
    name = "mongodb"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          image = "mongo"
          name  = "mongodb"

          port {
            container_port = 27017
          }
        }
      }
    }
  }
}
