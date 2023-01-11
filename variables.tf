# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-south-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "devops"
}

# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string 
  default = "172.20.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
}

  
# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type = bool
  default = true  
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type = bool
  default = true
}

variable "key_pair" {
  description = "Key pair name to be used in the EC2 instances"
  default = ""
}

variable "create_key_pair" {
  description = "Set True to create a new keypair with the key_pair name, when set to true you need to provide value to keypair_name"
  type = bool
}

variable "keypair_name" {
    description = "Name of the key pair to be created"
    type = string
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}

variable "user_data_file_jenkins_ansible" {
    description = "Shell script to install jenkins and ansible"
    default = "./scripts/jenkins.sh"
}


variable "user_data_file_ansible" {
    description = "Shell script to install ansible"
    default = "./scripts/ansible_docker.sh"
}

variable "ami_id" {
    description = "AMI id of the base OS image"
    default = ""
}

variable "jenkins_allow_ip" {
    description = "IP from which we can access jenkins"
    default = "27.0.50.224/32"
}


