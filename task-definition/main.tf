resource "aws_ecs_task_definition" "service" {
  family                = var.family
  container_definitions = jsonencode(var.container_definitions)
  network_mode          = "awsvpc"
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}
