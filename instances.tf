

resource "aws_instance" "anami-public-server-1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.nano"
  key_name                    = "anami-key-pair"
  subnet_id                   = aws_subnet.anami-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.anami_server_1_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "anami-public-server-1"
  }
}

resource "aws_instance" "anami-private-server-2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.nano"
  key_name                    = "anami-key-pair"
  subnet_id                   = aws_subnet.anami-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.anami_server_2_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "anami-private-server-2"
  }
}


