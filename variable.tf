variable "region" {
  default = "us-east-2"
}

variable "vpc" {
  default = "172.32.0.0/16"
}

variable "subnet_cidr" {
type="list"  
default = ["172.32.5.0/24","172.32.6.0/24","172.32.7.0/24"]
}
data "aws_availability_zones" "azs"{}
#variable "azs" {
#  type    = "list"
#  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
#}
