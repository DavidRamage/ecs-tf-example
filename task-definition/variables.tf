variable "family" {
  type = string
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
