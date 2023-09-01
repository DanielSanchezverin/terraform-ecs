provider "aws" {
  default_tags {
    tags = {
      Environment   = var.environment
      terraform     = var.terraform
      "Cost Center" = var.environment
    }
  }
}