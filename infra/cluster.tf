resource "aws_ecs_cluster" "this" {
  name = "test-cluster"
  tags = "${var.tags}"
}
