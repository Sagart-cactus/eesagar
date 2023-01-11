terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
  backend "s3" {
    bucket = "your_bucket_name_here"
    key = "test-setup"
    region = "region_of_your_bucket"
}
  required_version = ">= 1.2.0"
}