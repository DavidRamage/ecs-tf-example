data "aws_iam_role" "service_role" {
  name = var.iam_role_name
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    Tier = "Private"
  }
}
