resource "aws_lb_target_group" "target_group" {
  count       = length(var.ecr_repo_name)
  name        = "${var.ecr_repo_name[count.index]}-tg"
  port        = var.app_ports[count.index]
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.prod-vpc.id
  depends_on = [
    aws_alb.application_load_balancer
  ]
}