provider "aws" {
  region = "us-east-1"
}

module "elasticsearch" {
  source     = "git::https://github.com/tothenew/terraform-aws-elasticsearch.git"
  vpc_id     = "vpc-999999999999"
  subnet_ids = ["subnet-999999999999"]
  key_name   = "tothenew"
}
