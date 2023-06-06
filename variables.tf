variable "region" {
  description = "To select region of AWS"
  type        = string
}

variable "ecr_repo_name" {
  description = "List of repositories"
  type        = list(string)
}

variable "access_key" {
  description = "Access Key"
  type        = string
}

variable "secret_key" {
  description = "Secret Key"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "min_instance" {
  type        = number
  description = "Minimum number of instance(s)"
}

variable "max_instance" {
  type        = number
  description = "Maximum number of instance(s)"
}

variable "desired_instance" {
  type        = number
  description = "Minimum number of instance(s)"
}

variable "app_name" {
  description = "App Name"
  type        = string
}

variable "account_url" {
  type        = string
  description = "Represent ECR Path"
}

variable "app_ports" {
  type        = list(number)
  description = "Ports value for Microservice"
}

variable "task_family" {
  type        = list(string)
  description = "Task Family Name"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_count" {
  description = "Public Subnet Count"
  type        = number
}

variable "system_ip" {
  description = "IP lists to whitelist for SSH"
  type        = list(string)
}

variable "domain_name" {
  description = "To request ACM certificate for prod-domain name"
  type        = string
}

variable "db_instance_class" {
  type        = string
  description = "Database instance's class"
}

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Database password"
}