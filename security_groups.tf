resource "aws_security_group" "anami_server_1_sg" {
  name        = "anami_server_1_sg"
  description = "Security Group for servers"
  vpc_id      = aws_vpc.anami-vpc.id

  tags = {
    Name = "anami_server_1_sg"
  }
}

resource "aws_security_group" "anami_server_2_sg" {
  name        = "anami_server_2_sg"
  description = "Security Group for servers"
  vpc_id      = aws_vpc.anami-vpc.id

  tags = {
    Name = "anami_server_2_sg"
  }
}

resource "aws_security_group_rule" "anami_server_1_all_egress" {
  security_group_id = aws_security_group.anami_server_1_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow all outgoing"
}

resource "aws_security_group_rule" "anami_server_2_all_egress" {
  security_group_id = aws_security_group.anami_server_2_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "allow all outgoing"
}

resource "aws_security_group_rule" "server_1_admin_ssh" {
  security_group_id = aws_security_group.anami_server_1_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "SSH access within network"
}

resource "aws_security_group_rule" "server_2_allow_from_server_1" {
  security_group_id        = aws_security_group.anami_server_2_sg.id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.anami_server_1_sg.id
  description              = "SSH access from private subnet"
}