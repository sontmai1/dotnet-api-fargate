resource "aws_ecs_service" "service3" {
  name        = "auth-service"
  cluster     = aws_ecs_cluster.this.id
  launch_type = "FARGATE"

#  load_balancer {
#      target_group_arn = aws_lb_target_group.this.arn
#      container_port   = 80
#      container_name   = "container_openPELServices"
#    }

  task_definition = aws_ecs_task_definition.task3.arn
  desired_count = 1

  network_configuration {
    subnets          = data.aws_subnet_ids.this.ids
    security_groups  = [aws_security_group.this.id]
    assign_public_ip = true
  }

  

#    depends_on = [aws_lb.this]

  tags  = "${var.tags}"
}