variable "project_name_prefix" {
  type        = string
  description = "A string value to describe prefix of all the resources"
  default     = "dev-tothenew"
}
variable "region" {
  type        = string
  description = "A string value to describe region for ssm parameter"
  default     = "ap-northeast-1"
}
variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
  default = {
    Environment = "dev"
    Project     = "ToTheNew",
  }
}

variable "vpc_id" {
  type        = string
  description = "A string value for VPC ID"
  default = "vpc-0d6a6a0e5387a7523"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet Ids where server will be launched"
  default = ["subnet-0301a5dcf51dbf816","subnet-060149e327e06cc24"]
}

variable "security_group_ids" {
  type        = list(string)
  description = "A string value for Security Group ID"
  default     = []
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for creating AWS resources default alias for EC2 is aws/ebs and for AWS Elasticsearch aws/es"
  default     = "alias/aws/ebs"
}

variable "cloudwatch_logs_retention" {
  type        = number
  description = "Cloudwatch logs of the AWS Elasticsearch retention period"
  default     = 7
}

variable "volume_type" {
  type        = string
  description = "Volume type for EC2 instance default latest type"
  default     = "gp3"
}

variable "volume_size" {
  type        = number
  description = "Volume size of the EC2 instance"
  default     = 100
}

variable "volume_encrypted" {
  type        = bool
  description = "Volume can be encrypted through this check"
  default     = true
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete the volume after the termination of the EC2"
  default     = true
}

variable "elasticsearch_version" {
  type        = string
  description = "AWS Elasticsearch version default is 7.10 which is latest"
  default     = "7.10"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the Server"
  default     = "t3.large"
}

variable "instance_count" {
  type        = number
  description = "Number of node of AWS elasticsearch you want to launch"
  default     = 1
}

variable "availability_zone_count" {
  type        = number
  description = "Availability Zone count when zone is enabled"
  default     = 2
}

variable "zone_awareness_enabled" {
  type        = bool
  description = "Zone Awareness enable for multi AZ"
  default     = false
}

variable "automated_snapshot_start_hour" {
  type        = number
  description = "AWS elasticsearch snapshot start hour time"
  default     = 22
}

variable "advanced_security_options_enabled" {
  type        = bool
  description = "Advance Security Option to Enable for Authentication"
  default     = false
}
variable "master_user_name" {
  type        = string
  description = "Username of the security option enabled"
  default     = ""
}
variable "master_user_password" {
  type        = string
  description = "Password of the security option enabled"
  default     = ""
}

variable "create_iam_service_linked_role" {
  type        = bool
  default     = false
  description = "Whether to create `AWSServiceRoleForAmazonElasticsearchService` service-linked role. Set it to `false` if you already have an ElasticSearch cluster created in the AWS account and AWSServiceRoleForAmazonElasticsearchService already exists."
}

variable "create_aws_elasticsearch" {
  type        = bool
  description = "If you want to create the AWS elasticsearch enable this check"
  default     = false
}

variable "create_aws_ec2_elasticsearch" {
  type        = bool
  description = "If you want to create the AWS EC2 instance elasticsearch enable this check"
  default     = true
}

variable "key_name" {
  type        = string
  description = "Key name for launching the EC2 instance"
  default     = ""
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM Profile name for launching the EC2 instance"
  default     = ""
}

variable "ebs_optimized" {
  type        = bool
  description = "EBS optimized enable"
  default     = true
}

variable "disable_api_termination" {
  type        = bool
  description = "Disable API termination means disable instance termination"
  default     = true
}

variable "disable_api_stop" {
  type        = bool
  description = "Disable API stop means disable instance stop"
  default     = true
}

variable "source_dest_check" {
  type        = bool
  description = "Source destination Check"
  default     = true
}

variable "ami_id" {
  type        = string
  description = "AMI id of the Amazon Linux 2"
  default     = ""
}