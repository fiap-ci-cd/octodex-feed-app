variable "resource_group_name" {
  type    = string
  default = "exercicio-ci-cd-fiap"
  nullable = false
}

variable "app_service_plan_name" {
  type    = string
  default = "webapp-fiap"
  nullable = false
}

variable "app_service_name" {
  type    = string
  default = "octodex-fiap"
  nullable = false
}

variable "location" {
  type    = string
  default = "eastus"
  nullable = false
}
