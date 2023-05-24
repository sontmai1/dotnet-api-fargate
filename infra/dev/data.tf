data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_subnet_ids" "this" {
  # vpc_id = data.aws_vpc.this.id
  vpc_id      = "${aws_vpc.main.id}"
}
