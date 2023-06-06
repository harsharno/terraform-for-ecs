resource "aws_launch_configuration" "ecs_launch_config" {
  image_id                    = data.aws_ami.amazon_linux.id
  name                        = aws_ecs_cluster.prod_ecs_cluster.name
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ecs_node.name
  security_groups             = [aws_security_group.service_security_group.id]
  key_name                    = aws_key_pair.kp.key_name
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo su
echo "ECS_CLUSTER=${aws_ecs_cluster.prod_ecs_cluster.name}" >> /etc/ecs/ecs.config
EOF
}

resource "aws_autoscaling_group" "prod_asg" {
  name                      = "${var.app_name}-asg"
  vpc_zone_identifier       = aws_subnet.public_subnet.*.id
  launch_configuration      = aws_launch_configuration.ecs_launch_config.name
  desired_capacity          = var.desired_instance
  min_size                  = var.min_instance
  max_size                  = var.max_instance
  health_check_grace_period = 300
  health_check_type         = "EC2"
}