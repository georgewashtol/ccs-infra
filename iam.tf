resource "aws_iam_user" "terraform" {
  name = "terraform"
}

resource "aws_iam_user" "developer" {
  name = "developer"
}

resource "aws_iam_role" "ecs_task_execution" {
  name = "ecs_task_execution"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
}