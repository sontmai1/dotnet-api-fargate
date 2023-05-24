# Fetch AZs in the current region
data "aws_availability_zones" "available" {}

# var.tags["Name"] = "openpel-dev-vpc"



resource "aws_vpc" "main" {

  cidr_block = "172.17.0.0/16"

  # tags       = "${var.tags}"

  tags = {
    Name        = "vpc-${var.app}-${var.env}"
    application = "${var.app}"
    environment = "${var.env}"
  }

  
}

# Create var.az_count private subnets, each in a different AZ
resource "aws_subnet" "private" {
  count             = "${var.az_count}"
  cidr_block        = "${cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id            = "${aws_vpc.main.id}"
  tags = {
    Name        = "sn-private-${var.app}-${var.env}"
    application = "${var.app}"
    environment = "${var.env}"
  }
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(aws_vpc.main.cidr_block, 8, var.az_count + count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id                  = "${aws_vpc.main.id}"
  map_public_ip_on_launch = true
  tags = {
    Name        = "sn-public-${var.app}-${var.env}"
    application = "${var.app}"
    environment = "${var.env}"
  }
}


