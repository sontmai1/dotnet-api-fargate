resource "aws_ecs_cluster" "this" {
  name = "${var.app}-${var.env}"
  tags = "${var.tags}"
}
