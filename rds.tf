resource "aws_db_instance" "default" {
  allocated_storage    = 30
  db_name              = "${var.environment}-rds"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_security_group" "rds" {
  name        = "rds"
  description = "Allow inbound traffic to RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}