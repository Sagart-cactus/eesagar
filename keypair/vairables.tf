variable "keypair_name" {
    description = "Name of the key pair to be created"
    type = string
    default = "ee-test-keypair"
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
