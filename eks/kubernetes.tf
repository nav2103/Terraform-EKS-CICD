provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
}

resource "kubernetes_namespace" "test" {
  metadata {
    name = "nginx"
  }
}

resource "kubernetes_deployment" "test" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.test.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "test-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "test-app"
        }
      }
      spec {
        container {
          name  = "test-container"
          image = "nginx:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "test" {
  metadata {
    name      = "test-service"
    namespace = kubernetes_namespace.test.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.test.spec.template.metadata[0].labels["app"]
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
