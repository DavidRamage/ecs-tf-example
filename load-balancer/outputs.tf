output "load_balancer_arn" {
  value = aws_lb.load-balancer.arn
}

output "security_group_id" {
  value = aws_security_group.alb-security-group.id
}
