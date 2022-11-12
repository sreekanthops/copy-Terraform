provider "aws" {
  region = "us-east-2"
}

#resource "aws_instance" "ec2" {
#  ami                         = "${$var.ami}"
#  instance_type               = "${var.instance_type}"
#  subnet_id                   = "${var.subnet}"
#  associate_public_ip_address = "true"

#  tags = {
#    Name = "myinstance"
#  }
#}

resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${element(var.subnet_cidr,count.index)}"

  tags = {
    Name = "subnet-${count.index+1}"
  }
}
