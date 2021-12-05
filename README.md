# Ec2-creation-using-terraform.

## Description.

Terraform is a tool for building infrastructure with various technologies including Amazon AWS, Microsoft Azure, Google Cloud, and vSphere.

Here is a simple document on how to use Terraform to build an AWS EC2 .

## Prerequisites

- Terraform v1.0.11
- IAM user with administrator access to EC2.
- Terraform Installation steps.

## Variables used

region - Region of the EC2 (default: us-east-2)


project - Name of project this VPC is meant for (default: demo)

ami - Amazon Machine Image (AMI) ID

type - Instance type for  instance (default: t2.micro)

key - EC2 Key pair name

access_key - access key id for the IAM user

secret_key - secret key for the IAM user


# Terraform Installation and EC2 creation code and explanation :

## Prerequisites
- Create an IAM user on your AWS console that have access to create the required resources.
- Create a dedicated directory where you can create terraform configuration files.
- Terraform Installation steps

## Terraform installation
```
wget https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip
unzip terraform_0.15.3_linux_amd64.zip 
ls -l
-rwxr-xr-x 1 root root 79991413 May  6 18:03 terraform  <<=======
-rw-r--r-- 1 root root 32743141 May  6 18:50 terraform_0.15.3_linux_amd64.zip
mv terraform /usr/bin/
which terraform 
/usr/bin/terraform

```
## Lets Create a provider.tf file: 

```
provider "aws" {
  region     = ""
  access_key = "your access key"
  secret_key = "Your secret key"
}
```

Go to the directory that you wish to save your tfstate files.Then Initialize the working directory containing Terraform configuration files using below command.
```
terraform init
```

Lets start creating main.tf file with the details below.

```
resource "aws_instance"  "Instance Name" {  
  ami                          =  "Enter you ami id"
  instance_type                =  "Enter your instance type"
  associate_public_ip_address  =  true
  key_name                     =  "Enter the name for the key pair."
  vpc_security_group_ids       =  " Enter the id of your securty group."
  tags = {
    Name = "tag_name"
  }
    
}
```

## Lets validate the terraform files using
```
terraform validate
```
## Lets plan the architecture and verify once again.
```
terraform plan
```
## Lets apply the above architecture to the AWS.
```
terraform apply
```
