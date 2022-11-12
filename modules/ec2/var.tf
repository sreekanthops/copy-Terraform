variable "ami_id" {
  default = "ami-00c03f7f7f2ec15c3"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "172.32.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["172.32.1.0/24", "172.32.2.0/24", "172.32.3.0/24"]
}

variable "azs" {
  type    = "list"
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

data "aws_availability_zones" "azs" {}
