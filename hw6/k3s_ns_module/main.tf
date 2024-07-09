provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_resource_quota" "resource_quota" {
  metadata {
    name      = "${var.namespace}-quota"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    hard = {
      cpu    = var.resource_quota.cpu
      memory = var.resource_quota.memory
    }
  }
}


resource "kubernetes_role" "role" {
  metadata {
    name      = var.role_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "role_binding" {
  metadata {
    name      = var.role_binding_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.role.metadata[0].name
  }

  subject {
    kind      = "User"
    name      = var.user_name
    api_group = "rbac.authorization.k8s.io"
  }
}
