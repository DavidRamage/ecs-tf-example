variable "iam_role_name" {
  type    = string
  default = "AWSServiceRoleForECS"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "name" {
  type = string
}

variable "ecs_cluster_id" {
  type = string
}

variable "task_definition_arn" {
  type = string
}

variable "desired_count" {
  type    = number
  default = 3
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_proto" {
  type    = string
  default = "HTTP"
}

variable "matcher" {
  type    = string
  default = "200"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "health_check_port" {
  type    = number
  default = 80
}

variable "healthy_threshold" {
  type    = number
  default = 2
}

variable "unhealthy_threshold" {
  type    = number
  default = 2
}

variable "timeout" {
  type    = number
  default = 10
}

variable "interval" {
  type    = number
  default = 30
}

variable "vpc_id" {
  type = string
}

variable "load_balancer_arn" {
  type = string
}

variable "security_group_id" {
  type = string
}
