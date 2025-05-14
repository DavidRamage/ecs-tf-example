module "cluster" {
  source = "./cluster"
  vpc_id = var.vpc_id
}

module "nginx-task-definition" {
  source = "./task-definition"
  family = "nginx"
  container_definitions = [
    {
      cpu = 128
      memory = 512
      essential = true
      name = "nginx"
      image = "public.ecr.aws/nginx/nginx"
    }
  ]
}

module "nginx-service" {
  source = "./service"
  name = "nginx"
  ecs_cluster_id = module.cluster.cluster_id
  task_definition_arn = module.nginx-task-definition.task_definition_arn
}
