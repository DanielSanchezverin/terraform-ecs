data "aws_lb" "alb" {
  arn = var.alb_arn
}

resource "aws_alb_target_group" "main" {
  name        = var.project_name
  target_type = "instance"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path    = "/health"
    matcher = "200"
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  default_action {
    order = 100
    type  = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "400: Bad Request"
      status_code  = "400"
    }
  }
  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.certificate_arn
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https.arn
  priority     = var.listener_priority

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }

  condition {
    host_header {
      values = [var.subdomain]
    }
  }
}