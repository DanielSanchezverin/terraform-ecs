resource "aws_ecr_repository" "main" {
  name = "${var.environment}-${var.project_name}"
}
