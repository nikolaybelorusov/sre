variable "namespace" {
  description = "Namespace"
  type        = string
}

variable "resource_quota" {
  description = "Resource quota"
  type = object({
    cpu    = string
    memory = string
  })
  default = {
    cpu    = "0.5"
    memory = "256M"
  }
}

variable "role_name" {
  description = "Role"
  type        = string
}

variable "role_binding_name" {
  description = "Role binding"
  type        = string
}

variable "user_name" {
  description = "User to bind the role"
  type        = string
}
