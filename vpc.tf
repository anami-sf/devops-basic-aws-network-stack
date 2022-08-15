resource "aws_vpc" "anami-vpc" {
  cidr_block       = "10.252.0.0/23"
  instance_tenancy = "default"

  tags = {
    Name = "anami-vpc"
  }
}