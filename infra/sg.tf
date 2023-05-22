resource "aws_security_group" "this" {
  # vpc_id = data.aws_vpc.this.id
  name        = "sg_${var.app}"
  # name_prefix = "sg_${var.app}" 
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags              = "${var.tags}"
  
}
