# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

module "ec2_security_group" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "3.18.0"
    name = "${var.name}-sg"
    description = "Security Group for ${var.name}"
    vpc_id = var.vpc_id
    # Ingress Rules & CIDR Blocks
    ingress_rules = var.ingress_rules
    ingress_cidr_blocks = var.allow_cidr
    # Egress Rule - all-all open
    egress_rules = ["all-all"]
    tags = var.tags
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"
  name                   = "${var.name}"
  ami                    = length(var.ami) > 0 ? var.ami : data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.ec2_security_group.this_security_group_id]
  subnet_id = var.subnet_id
  user_data = file("${var.user_data}")
  tags = var.tags
}


