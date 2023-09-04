## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.15.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nginx"></a> [nginx](#module\_nginx) | ./modules/ecs | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.acm_validation](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_db_instance.default](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/db_instance) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/ecs_cluster) | resource |
| [aws_eip.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/eip) | resource |
| [aws_iam_role.task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonECSTaskExecutionRolePolicy](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/internet_gateway) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/lb_listener) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/nat_gateway) | resource |
| [aws_route53_record.acm](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.primary](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route53_zone) | resource |
| [aws_route_table.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route_table) | resource |
| [aws_route_table.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/route_table_association) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/security_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/security_group) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/5.15.0/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domain Name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (prod, stage, dev) | `string` | n/a | yes |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | Private subnet CIDR block | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | Public subnet CIDR block | `list(string)` | n/a | yes |
| <a name="input_terraform"></a> [terraform](#input\_terraform) | Resource created with terraform | `string` | `"True"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC CIDR block | `string` | n/a | yes |

## Outputs

No outputs.
