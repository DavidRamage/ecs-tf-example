resource "aws_ecs_service" "service" {
  name = var.name
  cluster = var.ecs_cluster_id
  desired_count = var.desired_count
  //iam_role = data.aws_iam_role.service_role.arn
  task_definition = var.task_definition_arn
}
