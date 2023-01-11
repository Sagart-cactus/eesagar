# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  ec2_keypair = var.create_key_pair ? module.ee_test_keypair[0].newly_created_keypair_name : var.key_pair
} 
