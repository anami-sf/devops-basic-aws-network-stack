# devops-basic-aws-network-stack
Terraform basic aws network stack

- [x]  aws VPC cider block (10.252.0.0)
- [x]  aws subnet 1 (10.252.0.0 - 10.252.0.255)
- [x]  aws subnet 2 (10.252.1.0 - 10.252.1.255)
- [x]  aws internet gateway will be available to all hosts in subnet 1
- [x]  aws nat gateway will be available to all hosts in subnet 2
- [x]  aws ec2 instance 1 hosted in subnet 1 (use the smallest instance) with elastic ip
- [x]  aws ec2 instance 2 hosted in subnet 2 (use the smallest instance) without elastic ip
- [x]  security groupss for ec2 instance should have port 22 open

validate

- [x]  should be able to ssh from your own to machine to ec2 instance 1
- [x]  should not be able to ssh from your own machien to ec2 instance 2
- [x]  should be able to ssh from ec2 instance 1 to ec2 instance 2
