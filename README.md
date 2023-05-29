# terraform-aws-elasticsearch

[![Lint Status](https://github.com/tothenew/terraform-aws-elasticsearch/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-elasticsearch/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-elasticsearch)](https://github.com/tothenew/terraform-aws-elasticsearch/blob/master/LICENSE)

This is a elasticsearch to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

# Usages

```
module "elasticsearch" {
  source     = "git::https://github.com/tothenew/terraform-aws-elasticsearch.git"
  vpc_id     = "vpc-999999999999"
  subnet_ids = ["subnet-999999999999"]
  key_name   = "tothenew"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |
| <a name="provider_template"></a> [template](#provider\_template) | >= 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.cloudwatch_log_resource_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_elasticsearch_domain.elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain) | resource |
| [aws_iam_instance_profile.elasticsearch_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.elasticsearch_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.elasticsearch_AmazonSSMManagedInstanceCore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_service_linked_role.service_linked_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_instance.ec2_elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.elasticsearch_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.elasticsearch_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | Advance Security Option to Enable for Authentication | `bool` | `false` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI id of the Amazon Linux 2 | `string` | `""` | no |
| <a name="input_automated_snapshot_start_hour"></a> [automated\_snapshot\_start\_hour](#input\_automated\_snapshot\_start\_hour) | AWS elasticsearch snapshot start hour time | `number` | `22` | no |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | Availability Zone count when zone is enabled | `number` | `2` | no |
| <a name="input_cloudwatch_logs_retention"></a> [cloudwatch\_logs\_retention](#input\_cloudwatch\_logs\_retention) | Cloudwatch logs of the AWS Elasticsearch retention period | `number` | `7` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map to add common tags to all the resources | `map(string)` | <pre>{<br>  "Environment": "dev",<br>  "Project": "ToTheNew"<br>}</pre> | no |
| <a name="input_create_aws_ec2_elasticsearch"></a> [create\_aws\_ec2\_elasticsearch](#input\_create\_aws\_ec2\_elasticsearch) | If you want to create the AWS EC2 instance elasticsearch enable this check | `bool` | `true` | no |
| <a name="input_create_aws_elasticsearch"></a> [create\_aws\_elasticsearch](#input\_create\_aws\_elasticsearch) | If you want to create the AWS elasticsearch enable this check | `bool` | `false` | no |
| <a name="input_create_iam_service_linked_role"></a> [create\_iam\_service\_linked\_role](#input\_create\_iam\_service\_linked\_role) | Whether to create `AWSServiceRoleForAmazonElasticsearchService` service-linked role. Set it to `false` if you already have an ElasticSearch cluster created in the AWS account and AWSServiceRoleForAmazonElasticsearchService already exists. | `bool` | `false` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | Delete the volume after the termination of the EC2 | `bool` | `true` | no |
| <a name="input_disable_api_stop"></a> [disable\_api\_stop](#input\_disable\_api\_stop) | Disable API stop means disable instance stop | `bool` | `true` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable API termination means disable instance termination | `bool` | `true` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | EBS optimized enable | `bool` | `true` | no |
| <a name="input_elasticsearch_version"></a> [elasticsearch\_version](#input\_elasticsearch\_version) | AWS Elasticsearch version default is 7.10 which is latest | `string` | `"7.10"` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Profile name for launching the EC2 instance | `string` | `""` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of node of AWS elasticsearch you want to launch | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type of the Server | `string` | `"t3.large"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name for launching the EC2 instance | `string` | `""` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS key ID for creating AWS resources default alias for EC2 is aws/ebs and for AWS Elasticsearch aws/es | `string` | `"alias/aws/ebs"` | no |
| <a name="input_master_user_name"></a> [master\_user\_name](#input\_master\_user\_name) | Username of the security option enabled | `string` | `""` | no |
| <a name="input_master_user_password"></a> [master\_user\_password](#input\_master\_user\_password) | Password of the security option enabled | `string` | `""` | no |
| <a name="input_project_name_prefix"></a> [project\_name\_prefix](#input\_project\_name\_prefix) | A string value to describe prefix of all the resources | `string` | `"dev-tothenew"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A string value for Security Group ID | `list(string)` | `[]` | no |
| <a name="input_source_dest_check"></a> [source\_dest\_check](#input\_source\_dest\_check) | Source destination Check | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet Ids where server will be launched | `list(string)` | n/a | yes |
| <a name="input_volume_encrypted"></a> [volume\_encrypted](#input\_volume\_encrypted) | Volume can be encrypted through this check | `bool` | `true` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Volume size of the EC2 instance | `number` | `100` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Volume type for EC2 instance default latest type | `string` | `"gp3"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | A string value for VPC ID | `string` | n/a | yes |
| <a name="input_zone_awareness_enabled"></a> [zone\_awareness\_enabled](#input\_zone\_awareness\_enabled) | Zone Awareness enable for multi AZ | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_elasticsearch_private_ip"></a> [ec2\_elasticsearch\_private\_ip](#output\_ec2\_elasticsearch\_private\_ip) | n/a |
| <a name="output_elasticsearch_arn"></a> [elasticsearch\_arn](#output\_elasticsearch\_arn) | n/a |
| <a name="output_elasticsearch_domain_id"></a> [elasticsearch\_domain\_id](#output\_elasticsearch\_domain\_id) | n/a |
| <a name="output_elasticsearch_domain_name"></a> [elasticsearch\_domain\_name](#output\_elasticsearch\_domain\_name) | n/a |
| <a name="output_elasticsearch_endpoint"></a> [elasticsearch\_endpoint](#output\_elasticsearch\_endpoint) | n/a |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | n/a |
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-elasticsearch/blob/main/LICENSE) for full details.
