# Create log group to store ECS Cluster logs
resource "aws_cloudwatch_log_group" "main" {
  name              = "${var.environment}-ecs-cluster"
  retention_in_days = 30
}

# Create ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.environment}-ecs-cluster"
  configuration {
    execute_command_configuration {
      log_configuration {
        cloud_watch_log_group_name = aws_cloudwatch_log_group.main.name
      }
    }
  }
}

# Create ECS role
resource "aws_iam_role" "task_execution_role" {
  name               = "task-execution-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
              "Service": "ecs-tasks.amazonaws.com"
              },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

# Attach AmazonECSTaskExecutionRolePolicy to task-execution-role
resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicy" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}