resource "aws_kms_key" "cluster-key" {
  description = "ecs_cluster_key"
  deletion_window_in_days = 7
}

resource "aws_ecs_cluster" "demo-cluster" {
  name = "demo-cluter"
  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.cluster-key.arn
    }
  }
}
