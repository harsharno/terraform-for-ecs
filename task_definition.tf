resource "aws_ecs_task_definition" "prod_task_definition" {
  # task_definition = aws_ecs_task_definition.prod_task_definition.family
  family = var.task_family[count.index]
  count  = length(var.ecr_repo_name)
  container_definitions = jsonencode([
    {
      name      = "${var.ecr_repo_name[count.index]}"
      image     = "${var.account_url}/${var.ecr_repo_name[count.index]}"
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = "${var.app_ports[count.index]}"
          hostPort      = 0
        }
      ]
    }
  ])
}