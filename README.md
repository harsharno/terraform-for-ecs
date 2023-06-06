## Terraform for ECS Deployment with EC2
Terraform ECS Deployment with EC2 Instances.

## Description
This terraform block will create the ECS Cluster and all related AWS services to host the application in an automated way. This will also check and install (if needed) terraform and AWS-CLI which, are mandatory for this script to be executed.

## Requirements
OS: Ubuntu 18.04 or above
Patient to read through all the messages that come to your screen.

## Installation
1. Clone this repo in your system where it's safe for future usage.
2. Need to make sure that the directory you create to clone this repo, should NOT be created with "SUDO" privileges.
3. Find and edit terraform.tfvars file in the cloned repository with proper information.
4. Use make commands as per the below scenario:
    a. Creating infrastructure for the particular project the first time: make start
    b. Changes in infrastructure and apply to the existing one: make apply
    c. To Destroy running infrastructure and recreate it: make recreate
    d. To Destroy already running infrastructure: make destroy
5. Check your Infrastructure in AWS Console
6. For support or change suggestions, please contact on below details

## Support
Dhaval Vaitha(dhaval.vaitha@openxcell.com)
Harsh Patel(harsh.patel@openxcell.com)