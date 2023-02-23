variable "resource_group_name" {
  type    = string
  default = "exercicio-aula-04"
  nullable = false
}

variable "app_service_plan_name" {
  type    = string
  default = "webapp-fiap"
  nullable = false
}

variable "app_service_name" {
  type    = string
  default = "exercicio-ci-cd-aula-04"
  nullable = false
}

variable "location" {
  type    = string
  default = "westus"
  nullable = false
}
