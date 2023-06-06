resource "aws_ecs_service" "ecs_service" {
  lifecycle {
    create_before_destroy = true
  }

  count                = length(var.ecr_repo_name)
  name                 = var.ecr_repo_name[count.index]
  cluster              = aws_ecs_cluster.prod_ecs_cluster.id
  task_definition      = aws_ecs_task_definition.prod_task_definition[count.index].arn
  depends_on           = [aws_ecs_task_definition.prod_task_definition]
  desired_count        = 2
  launch_type          = "EC2"
  iam_role             = aws_iam_role.ecs_service_role.name
  force_new_deployment = true
  scheduling_strategy  = "REPLICA"

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group[count.index].arn
    container_name   = var.ecr_repo_name[count.index]
    container_port   = var.app_ports[count.index]
  }
}