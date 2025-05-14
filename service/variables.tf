variable "iam_role_name" {
  type = string
  default = "AWSServiceRoleForECS"
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
  type = number
  default = 3
}
