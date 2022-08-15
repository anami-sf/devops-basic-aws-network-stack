resource "aws_internet_gateway" "anami-internet-gateway" {
  vpc_id = aws_vpc.anami-vpc.id

  tags = {
    Name = "anami-internet-gateway"
  }
}

resource "aws_eip" "anami-nat-eip" {
  vpc = true

  tags = {
    Name = "anami-nat-eip"
  }
}

resource "aws_nat_gateway" "anami-nat-gateway" {
  allocation_id = aws_eip.anami-nat-eip.id
  subnet_id     = aws_subnet.anami-subnet-2.id

  tags = {
    Name = "anami-nat-gateway"
  }

  depends_on = [aws_internet_gateway.anami-internet-gateway]
}