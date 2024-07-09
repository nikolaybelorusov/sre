output "namespace" {
  description = "Namespace created"
  value       = kubernetes_namespace.namespace.metadata[0].name
}

output "resource_quota" {
  description = "Quota for namespace"
  value       = kubernetes_resource_quota.resource_quota.spec[0].hard
}

output "role" {
  description = "Role created"
  value       = kubernetes_role.role.metadata[0].name
}

output "role_binding" {
  description = "Binding created "
  value       = kubernetes_role_binding.role_binding.metadata[0].name
}
