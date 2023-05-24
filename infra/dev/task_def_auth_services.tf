resource "aws_ecs_task_definition" "task3" {
  family                   = "auth-service"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "auth-service"
      "image" : "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/openpel-authservice:0.0.0.1",
      "portMappings" : [
        { containerPort = 8080 }
      ],
    }]
  )

  tags = {
    Name        = "task-${var.app}-${var.env}"
    application = "${var.app}"
    environment = "${var.env}"
  }
}