provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
}

resource "aws_vpc" "vpc_ex" {
  cidr_block = "${var.vpc}"

  tags = {
    Name = "vpc1"
  }
}

resource "aws_subnet" "subnets" {
  count             = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id            = "${aws_vpc.vpc_ex.id}"
  cidr_block        = "${element(var.subnet_cidr,count.index)}"

  tags = {
    Name = "subnet-${count.index+1}"
  }

}
