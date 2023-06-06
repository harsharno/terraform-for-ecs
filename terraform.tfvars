//AWS Access keys - Make IAM user with Admin/limited access and paste keys below
//STRICTLY - DO NOT POST IT TO ANY PUBLIC REPOSITORY.
access_key = ""
secret_key = ""

//VPC Configuration, If Possible Go with below details. If there is any changes in CIDR Block of VPC, Need to change at few instances in this infra. Ask someone from support details.
vpc_cidr            = "10.0.0.0/16"
public_subnet_count = 2                 //Mention the count of Public subnets you wish to create
system_ip           = ["IP-ADDRESS/32"] //Mention the list of IP in array format to white list for ssh purpose. MAKE SURE TO POST FIX ALL IPs WITH /32 MASK

//Choose ECR repo, App name, Account URL and their ports with proper naming convention, Take help of seniors for the same
app_name      = ""       //ECS Cluster would also be cretaed by this name
account_url   = ""       //Combination of {accountID}.dkr.ecr.{region}.amazonaws.com. Double check before moving ahead
ecr_repo_name = ["", ""] //Mention repository name as mentioned (array). Ask senior if having confusion
app_ports     = []       //Mention ports value as same order as repo names mentioned (array with number and not string). Ask senior if having confusion
task_family   = ["", ""] //Task definitions names which also has to be in order with above app ports and repo name, Make sure to name them as per naming convention with proper

//Double check the region programmatic name with client/dev/senior to avoid mistakes here
region = ""

//Autoscalling Adjustment. Defins how many instance should be up and running at perticular time period. 
min_instance     = "2"
max_instance     = "3"
desired_instance = "2"

//EC2 Settings. Verify instance types as this will be applicable to ECS Cluster's Instances
instance_type = ""

//RDS Settings. Verify username, instance type and passwords before continue. Change the password with atelast 12 char string
//use https://password.openxcell.dev/ to generate password of desired characters
//This info will allow to create RDS instance with MySql (engine:5.7)
db_instance_class = "" //Make sure to use db at the beginning of class
db_username       = ""
db_password       = ""

//Domain Name details
domain_name = "" //Make sure NOT to incude *, www or any other subdomain. This will make request for main domain and * with domain at prefix