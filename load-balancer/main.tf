resource "aws_lb" "load-balancer" {
  name                       = "demo-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb-security-group.id]
  subnets                    = tolist(data.aws_subnets.public.ids)
  enable_deletion_protection = false
}

resource "aws_security_group" "alb-security-group" {
  name        = "alb_security_group"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow-http" {
  security_group_id = aws_security_group.alb-security-group.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  type              = "ingress"
}

resource "aws_security_group_rule" "allow-all" {
  security_group_id = aws_security_group.alb-security-group.id
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  type              = "egress"
  from_port         = 0
  to_port           = 0
}
