#!/bin/bash
YEL='\033[0;33m'
NC='\033[0m'

# Check if Terraform is already installed
clear
echo "${YEL}Validating if Terraform is installed${NC}" 
sleep 3
if [ -z "$(which terraform)" ]; then
  echo "Terraform is not installed, Preparing to install."
  echo "${YEL}Installing Terraform...${NC}"
  sleep 3
  wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
  unzip terraform_1.3.7_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  rm terraform_1.3.7_linux_amd64.zip
  read -p "Press [Enter] to continue" enter
  # sh ./beta.sh
else
  echo "${YEL}Terraform is already installed${NC}"
  read -p "Press [Enter] to continue" enter
  # sh ./beta.sh
fi

# Check if Terraform is already installed
echo "${YEL}\nValidating if AWS-CLI is installed${NC}" 
sleep 3
if [ -z "$(which aws)" ]; then
  echo "AWS-CLI is not installed, Preparing to install."
  echo "${YEL}Installing AWS-CLI...${NC}"
  sleep 3
  cd ~
  mkdir aws-cli && cd aws-cli
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  read -p "Press [Enter] to continue" enter
  sh ./beta.sh
else
  echo "${YEL}AWS-CLI is already installed${NC}"
  read -p "Press [Enter] to continue" enter
  sh ./beta.sh
fi