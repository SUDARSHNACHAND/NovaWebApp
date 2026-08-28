variable "app_name" {
  description = "Application name"
  type        = string
  default     = "novawebapp"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "novawebapp"
}

variable "replicas" {
  description = "Number of application replicas"
  type        = number
  default     = 2
}

variable "docker_image" {
  description = "Docker Hub image"
  type        = string
  default     = "sudarshnachand/novawebapp-ci:latest"
}