provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_namespace" "k3s_namespace" {
  metadata {
    name = "staging"
  }
}
