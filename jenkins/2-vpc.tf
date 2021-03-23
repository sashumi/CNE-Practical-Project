resource "aws_vpc" "jenkins" {

  cidr_block = "10.10.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true # not sure what this is, but using from example
  enable_dns_support = true # not sure what this is, but using from example

  tags = merge(
  {
    "Name" = "jenkins"
  }
  )
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.jenkins.id
  availability_zone = "eu-west-1a"
  cidr_block = "10.10.10.0/24"

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.jenkins.id
  availability_zone = "eu-west-1b"
  cidr_block = "10.10.20.0/24"

  tags = {
    Name = "subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id = aws_vpc.jenkins.id
  availability_zone = "eu-west-1c"
  cidr_block = "10.10.30.0/24"

  tags = {
    Name = "subnet3"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkins.id

  tags = {
    Name = "jenkins_igw"
  }
}