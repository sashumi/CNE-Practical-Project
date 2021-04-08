
resource "aws_security_group" "ssh_sg" {
  name = "ssh_sg"
  description = "Allow traffic to jenkins"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "22 from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block,
      "130.43.176.247/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_security_group" "allow_80_public_to_elb" {
  name = "allow_80_public_to_elb"
  description = "Allow traffic to ELB"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "allow_80_public_to_elb"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block,
      "130.43.176.247/32",
      //https://github.blog/changelog/2019-04-09-webhooks-ip-changes/
      "140.82.112.0/20"
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80_public_to_elb",
    Project = "project2",
    Author = "sashumi"
  }
}

resource "aws_security_group" "allow_80_from_elb_to_vm" {
  name = "allow_80_from_elb_to_vm"
  description = "allow ELB to connect to port 80 of instance only"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "allow_80_from_elb_to_vm"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80_from_elb_to_vm",
    Project = "project2",
    Author = "sashumi"
  }
}