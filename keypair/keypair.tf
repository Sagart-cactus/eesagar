resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "keypair" {
  source = "terraform-aws-modules/key-pair/aws"
  key_name   = var.keypair_name
  public_key = tls_private_key.pk.public_key_openssh
}

locals {
  name = "${var.business_divsion}-${var.environment}"
}
resource "local_sensitive_file" "pem_file" {
  filename = pathexpand("./${var.keypair_name}.pem")
  file_permission = "600"
  directory_permission = "700"
  content  = tls_private_key.pk.private_key_pem
}