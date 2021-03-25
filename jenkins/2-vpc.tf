//create vpc, subnet,IG

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

resource "aws_eip" "jenkins_ip" {
  // not adding any parameter. checking if it works
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkins.id

  tags = {
    Name = "jenkins_igw"
  }
}

# add a route table to route outbound internet traffic to Internet gateway
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.jenkins.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "rtb_subnet_public" {
  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "rtc_subnet_public" {
  subnet_id = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rtb_public.id
}