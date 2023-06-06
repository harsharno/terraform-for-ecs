#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
YEL='\033[0;33m'
NC='\033[0m'
clear
echo "${BLUE}Moving to initiate your infrastructure.${NC}"
echo "Hope you have verify the TERRAFORM.TFVARS file and it's value you have set to start the infrastructure provision."
echo "\nPress ctrl+c to break to change or verify any value before moving ahead."
echo "\n\n${BLUE}Services that will be created with this script${NC}"
echo "${YEL}1. Elastic Container Service with EC2 (ECS)"
echo "2. Elastic Container Registery (ECR)"
echo "3. Task Definitions and Services for respective Repository and it's micro services"
echo "4. PEM file at your current directory in case you want to make ssh in ECS instances"
echo "5. IAM Roles to laverage services to interect to each other" 
echo "6. Load Balancer with listeners"
echo "7. Taget group with respective Registerd targets(ec2) on dynamic ports"
echo "8. Security groups for respective services"
echo "9. RDS with MySql with engine version 8.0"
echo "10. Two S3 Buckets, one will private and one will public"
echo "11. ACM Request for mentioned domain in tfvars file"
echo "12. Custom VPC with mentioned CIDR Block and Number of subnets you provide in tfvars file"
echo "13. Internet Gateway to have internet for instances in any subnets they placed in${NC}"
read -p "Press [Enter] to continue" enter
echo "\n\n${BLUE}Provisioning Infrastructure. It will take a while to have provisioned${NC}"
echo "Inititalising Terraform modules"
read -p "Press [Enter] to continue" enter
make init
echo "\n${BLUE}Validating TF files${NC}"
read -p "Press [Enter] to continue" enter
make validate
echo "\n${BLUE}Applying......Provisioning......Sit back${NC}"
read -p "Press [Enter] to continue" enter
make fmt
make apply
echo "\n${YEL}You will find ACM CNAME and value record in your current directory with name [Domain name]_cname.txt"
echo "\nFew manual steps needs to be done:"
echo "1. Add ACM CNAME and value in your domain provider as cname record"
echo "2. Remove all listeners in Load Balancer except 80. Make it permanently redirect to 443 with 301 code"
echo "3. Attach ACM Certificate to 443 listener while creating that rule"
echo "4. Define your rule as per your requirement such as domain base routing or path base routing within 443 Listeners${NC}"
read -p "Press [Enter] to continue" enter
echo "${RED}\nNOTE: Do not delete terraform.tfstate file, Also you are using Access and secret keys in tfvars file. Make sure not to push in any of public repository${NC}"
echo "\nHope everythings provisioned as expected"