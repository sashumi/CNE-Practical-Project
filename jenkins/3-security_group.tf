// create security group with port 22, 80

resource "aws_security_group" "jenkins_sg_80" {
  name = "jenkins_sg_80"
  description = "Allow web traffic to jenkins"
  vpc_id = aws_vpc.jenkins.id

  ingress {
    description = "open port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.jenkins.cidr_block,
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg_80"
  }
}

resource "aws_security_group" "jenkins_sg_22" {
  name = "jenkins_sg_22"
  description = "Allow web traffic to jenkins"
  vpc_id = aws_vpc.jenkins.id

  ingress {
    description = "open port 80"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.jenkins.cidr_block,
      "130.43.176.0/24"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "130.43.176.0/24"]
  }

  tags = {
    Name = "jenkins_sg_22"
  }
}