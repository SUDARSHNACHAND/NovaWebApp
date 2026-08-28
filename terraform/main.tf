provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "novawebapp" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "novawebapp" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.novawebapp.metadata[0].name

    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.docker_image

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "novawebapp" {
  metadata {
    name      = "${var.app_name}-service"
    namespace = kubernetes_namespace.novawebapp.metadata[0].name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = 5000
      target_port = 5000
    }

    type = "NodePort"
  }
}