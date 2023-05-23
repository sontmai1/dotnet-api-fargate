resource "aws_ecs_task_definition" "task2" {
  family                   = "test_api"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "pel-services"
      "image" : "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/pelservices",
      "portMappings" : [
        { containerPort = 8080 }
      ],
    }]
  )

  tags                    = "${var.tags}"
}