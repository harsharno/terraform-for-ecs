output "vpc_id" {
  value = aws_vpc.prod-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.prod-vpc.cidr_block
}

output "subnet_counts" {
  value = var.public_subnet_count
}

output "subnet_id" {
  value = aws_subnet.public_subnet.*.id
}

output "subnet_cidr" {
  value = aws_subnet.public_subnet.*.cidr_block
}

output "ecr_repository" {
  value = aws_ecr_repository.ecr_repository.*.name
}

output "public_bucket_name" {
  value = aws_s3_bucket.prod-bucket-public.bucket
}

output "private_bucket_name" {
  value = aws_s3_bucket.prod-bucket-private.bucket
}

output "alb_endpoint" {
  value = aws_alb.application_load_balancer.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.prod-rds.endpoint
}

output "app_name" {
  value = var.app_name
}

output "region" {
  value = var.region
}

output "ec2_instacne_type" {
  value = var.instance_type
}

output "ec2_rds_type" {
  value = var.db_instance_class
}