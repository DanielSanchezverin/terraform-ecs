module "nginx" {
  source = "./modules/ecs"

  environment      = var.environment
  project_name     = "nginx-${var.environment}"
  task_role_arn    = aws_iam_role.task_execution_role.arn
  ecs_cluster_name = aws_ecs_cluster.main.name
  ecs_cluster_id   = aws_ecs_cluster.main.id
  vpc_id           = aws_vpc.main.id

  alb_arn = aws_lb.main.arn

  subdomain       = "nginx.${aws_route53_zone.primary.name}"
  route53_zone_id = aws_route53_zone.primary.zone_id

  certificate_arn   = aws_acm_certificate.main.arn
  listener_priority = 1

  environment_variables = [
    {
      name  = "RDS"
      value = aws_db_instance.default.address
    }
  ]
}