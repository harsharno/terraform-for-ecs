resource "aws_db_instance" "prod-rds" {
  identifier             = lower("${var.app_name}-prod")
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = flatten([aws_subnet.public_subnet.*.id])
}