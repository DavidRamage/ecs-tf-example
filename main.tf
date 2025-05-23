module "cluster" {
  source = "./cluster"
}

module "nginx-task-definition" {
  source = "./task-definition"
  family = "nginx"
  container_definitions = [
    {
      cpu       = 128
      memory    = 512
      essential = true
      name      = "nginx"
      image     = "public.ecr.aws/nginx/nginx:stable-alpine"
      portMappings = [{
        hostPort      = 80
        containerPort = 80
      }]
    }
  ]
}

module "nginx-service" {
  source              = "./service"
  name                = "nginx"
  ecs_cluster_id      = module.cluster.cluster_id
  task_definition_arn = module.nginx-task-definition.task_definition_arn
  vpc_id              = var.vpc_id
  container_port      = 80
  load_balancer_arn   = module.load-balancer.load_balancer_arn
  security_group_id   = module.load-balancer.security_group_id
}

module "load-balancer" {
  source = "./load-balancer"
  vpc_id = var.vpc_id
}
