resource "aws_ecs_service" "service" {
  name = var.name
  cluster = var.ecs_cluster_id
  desired_count = var.desired_count
  task_definition = var.task_definition_arn
}

resource "aws_lb_target_group" "service" {
  name = var.name
  port = var.container_port
  target_type = "ip"
  vpc_id = var.vpc_id
  protocol = var.protocol
  health_check {
    path = var.health_check_path
    protocol = var.health_check_proto
    matcher = var.matcher
    port = var.health_check_port
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    interval = var.interval
  }
}

