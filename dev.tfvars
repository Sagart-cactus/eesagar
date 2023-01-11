# Input Variables
# AWS Region
aws_region = "ap-south-1"

# Environment Variable
environment = "dev"

# Business Division
business_divsion = "devops"


# VPC Input Variables

# VPC Name
vpc_name = "ee-tech-int"


# VPC CIDR Block
vpc_cidr_block = "172.20.0.0/16"


# VPC Availability Zones according to the region what you have specified in the `aws_region` variable
vpc_availability_zones = ["ap-south-1a", "ap-south-1b"]


# VPC Public Subnets
vpc_public_subnets = ["172.20.10.0/24"]


# VPC Private Subnets
vpc_private_subnets = ["172.20.20.0/24"]
  
# VPC Enable NAT Gateway (True or False) 
vpc_enable_nat_gateway = true  


# VPC Single NAT Gateway (True or False)
vpc_single_nat_gateway = true

#Uncomment and use only if you have exiting key pair, set create_key_pair if using existing key pair
#key_pair = ""

#Set True to create a new keypair with the key_pair name, when set to true you need to provide value to keypair_name
# Also set this to false if you are using an existing key pair
create_key_pair = true

keypair_name = "ee-test-keypair"


# AWS EC2 Instance Type
instance_type = "t3.micro"  

#Shell script to install jenkins and ansible
user_data_file_jenkins_ansible = "./scripts/jenkins.sh"

#Shell script to install ansible and docker
user_data_file_ansible = "./scripts/ansible_docker.sh"

# Uncomment this line if you want to use a specific AMI for the instances. Please keep in mind the user data scripts are keeping in mind Amazon Linux2
#ami_id = ""

#IP from which we can access jenkins
jenkins_allow_ip = "27.0.50.224/32"
