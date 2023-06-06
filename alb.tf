resource "aws_alb" "application_load_balancer" {
  name               = "${var.app_name}-prod-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public_subnet.*.id
  security_groups    = [aws_security_group.load_balancer_security_group.id]
}

resource "aws_alb_listener" "alb_listeners" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  count             = length(var.app_ports)
  port              = var.app_ports[count.index]
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group[count.index].arn
    type             = "forward"
  }
}