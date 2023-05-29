output "elasticsearch_arn" {
  value = var.create_aws_elasticsearch && !var.create_aws_ec2_elasticsearch ? aws_elasticsearch_domain.elasticsearch[0].arn : "undefined"
}
output "elasticsearch_domain_id" {
  value = var.create_aws_elasticsearch && !var.create_aws_ec2_elasticsearch ? aws_elasticsearch_domain.elasticsearch[0].domain_id : "undefined"
}
output "elasticsearch_domain_name" {
  value = var.create_aws_elasticsearch && !var.create_aws_ec2_elasticsearch ? aws_elasticsearch_domain.elasticsearch[0].domain_name : "undefined"
}
output "elasticsearch_endpoint" {
  value = var.create_aws_elasticsearch && !var.create_aws_ec2_elasticsearch ? aws_elasticsearch_domain.elasticsearch[0].endpoint : "undefined"
}
output "kibana_endpoint" {
  value = var.create_aws_elasticsearch && !var.create_aws_ec2_elasticsearch ? aws_elasticsearch_domain.elasticsearch[0].kibana_endpoint : "undefined"
}

output "ec2_elasticsearch_private_ip" {
  value = !var.create_aws_elasticsearch && var.create_aws_ec2_elasticsearch ? aws_instance.ec2_elasticsearch[0].private_ip : "undefined"
}