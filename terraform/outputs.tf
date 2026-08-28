output "namespace" {
  description = "Kubernetes namespace"
  value       = kubernetes_namespace.novawebapp.metadata[0].name
}

output "deployment" {
  description = "Kubernetes deployment"
  value       = kubernetes_deployment.novawebapp.metadata[0].name
}

output "service" {
  description = "Kubernetes service"
  value       = kubernetes_service.novawebapp.metadata[0].name
}

output "replicas" {
  description = "Number of application replicas"
  value       = var.replicas
}