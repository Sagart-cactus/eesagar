variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}

variable "subnet_id" {
    description = "Subnet ID where we need to create EC2 instance"
}

variable "user_data" {
    description = "Shell script file which will be assigned to user_data of EC2 and executed at creation of EC2"
}

variable "tags" {
    description = "tags to be attached to EC2 and related entities"
    default =  {
      owners = "default"
      environment = "dev"
    }
}

variable "name" {
    description = "Name of the EC2 instance"
}

variable "ami" {
    description = "AMI ID of the instance image"
    default = ""
}

variable "vpc_id" {
    description = "VPC id for security group"
}

variable "allow_cidr" {
    description = "CIDR block from where to allow access to ec2 instance"
}

variable "ingress_rules" {
    description = "ports to be opened"
}