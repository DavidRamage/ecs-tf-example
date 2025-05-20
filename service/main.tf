resource "aws_ecs_service" "service" {
  name            = var.name
  cluster         = var.ecs_cluster_id
  desired_count   = var.desired_count
  task_definition = var.task_definition_arn
  launch_type     = "FARGATE"
  load_balancer {
    target_group_arn = aws_lb_target_group.service.arn
    container_name   = var.name
    container_port   = var.container_port
  }

  network_configuration {
    subnets         = tolist(data.aws_subnets.private.ids)
    security_groups = [aws_security_group.nginx-security-group.id]
  }
}

resource "aws_lb_target_group" "service" {
  name        = var.name
  port        = var.container_port
  target_type = "ip"
  vpc_id      = var.vpc_id
  protocol    = var.protocol
  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_proto
    matcher             = var.matcher
    port                = var.health_check_port
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service.arn
  }
}

resource "aws_security_group" "nginx-security-group" {
  name        = "nginx_security_group"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id
}


resource "aws_security_group_rule" "allow-alt-http" {
  security_group_id        = aws_security_group.nginx-security-group.id
  source_security_group_id = var.security_group_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  type                     = "ingress"
}

resource "aws_security_group_rule" "allow-all" {
  security_group_id = aws_security_group.nginx-security-group.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  type              = "egress"
  from_port         = 0
  to_port           = 0
}
