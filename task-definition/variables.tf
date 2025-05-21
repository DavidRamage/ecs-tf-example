variable "family" {
  type = string
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "container_definitions" {
  type = list(object({
    name        = string
    image       = string
    cpu         = number
    memory      = number
    essential   = bool
    environment = optional(list(map(string)), [])
    portMappings = optional(list(object({
      containerPort = number
      hostPort      = number
    })))
  }))
}
