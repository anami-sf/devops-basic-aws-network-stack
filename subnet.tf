resource "aws_subnet" "anami-subnet-1" {
  vpc_id = aws_vpc.anami-vpc.id
  # 10.252.0.0 - 10.252.0.255
  cidr_block              = "10.252.0.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.anami-internet-gateway]

  tags = {
    Name = "anami-subnet-1"
  }
}

resource "aws_subnet" "anami-subnet-2" {
  vpc_id            = aws_vpc.anami-vpc.id
  availability_zone = "us-west-2a"
  # 10.252.1.0 - 10.252.1.255
  cidr_block = "10.252.1.0/24"

  tags = {
    Name = "anami-subnet-2"
  }
}