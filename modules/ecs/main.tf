# Create task definition
resource "aws_ecs_task_definition" "main" {
  family = var.project_name
  container_definitions = jsonencode([
    {
      name      = var.project_name
      image     = "nginx:latest"
      cpu       = 256
      memory    = 256
      essential = true
      network_mode = "bridge"
      taskRoleArn = var.task_role_arn
      portMappings = [
        {
          containerPort = 3000
          protocol = "tcp"
        }
      ]
      environment = concat([
        {
          name  = "NGINX_PORT"
          value = "3000"
        },
      ], var.environment_variables)
    }
  ])
}

# Create ECS service
resource "aws_ecs_service" "main" {
  name            = var.project_name
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  iam_role        = var.task_role_arn

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  load_balancer {
    target_group_arn = aws_alb_target_group.main.arn
    container_name   = var.project_name
    container_port   = 3000
  }

  deployment_controller {
    type = "ECS"
  }
}