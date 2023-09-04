variable "environment" {
  type        = string
  description = "Environment (prod, stage, dev)"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "task_role_arn" {
  type = string
  description = "Task role arn"
}

variable "ecs_cluster_name" {
  type = string
  description = "ECS Cluster name"
}

variable "ecs_cluster_id" {
  type = string
  description = "ECS Cluster id"
}

variable "alb_arn" {
  type = string
  description = "ALB arn"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "certificate_arn" {
  type = string
  description = "ACM Certificate arn"
}

variable "subdomain" {
  type = string
  description = "Application subdomain"
}

variable "listener_priority" {
  type = string
  description = "Listener priority"
}