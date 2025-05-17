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

resource "aws_vpc_security_group_ingress_rule" "allow-tls" {
  security_group_id = aws_security_group.alb-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow-all" {
  security_group_id = aws_security_group.alb-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
