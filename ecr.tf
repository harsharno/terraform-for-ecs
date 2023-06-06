resource "aws_ecr_repository" "ecr_repository" {
  count = length(var.ecr_repo_name)
  name  = var.ecr_repo_name[count.index]
}