# Setup Guide

### Pre-requisite
- Adequate access and privileges of an AWS account
- AWS CLI installed and configured
- terraform installed
- openssh installed
Optionally you can install `telnet` to debug if ec2 instance access issues.

### Step 1: Terraform State Bucket 🪣
- Create Terraform state bucket
`aws s3 mb s3://your_bucket_name --region region_name`

- Check if the bucket has been created properly
`aws s3 ls`
- Enable versioning on the bucket
`aws s3api put-bucket-versioning --bucket your_bucket_name --versioning-configuration Status=Enabled`
- Enable encryption on the bcuket
`aws s3api put-bucket-encryption --bucket your_bucket_name --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'`

### Step 2: Configure Terraform to use the new created S3 bucket
Add the newly created bucket and its region in the `backend.tf` file
Make the changes in the below block
```
backend "s3" {
    bucket = "your_bucket_name_here"
    key = "test-setup"
    region = "region_of_your_bucket"
}
```
### Step4: Fill in the variable values
Assign appropriate values to the variables in the `dev.tfvars` file

### Step 5: Execute Terraform
- `terraform init`
- `terraform plan -var-file=./dev.tfvars` (you should have 25 items to add)
- `terraform apply -var-file=./dev.tfvars --auto-approve`


### Step 6: Destroy the Stack and bucket

- Destroy the stack using `terraform destroy -var-file=./dev.tfvars --auto-approve`
- Delete all the objects in S3 bucket
 ```
aws s3api delete-objects --bucket your_bucket_name_here \ 
  --delete "$(aws s3api list-object-versions \
  --bucket "your_bucket_name_here" \
  --output=json \
  --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
  ```
- Delete the bucket `aws s3 rb s3://your_bucket_name --region region_name`

