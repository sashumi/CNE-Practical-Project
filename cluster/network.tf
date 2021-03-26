//create vpc, subnet,IG

resource "aws_vpc" "k8s" {

  cidr_block = "10.20.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true # not sure what this is, but using from example
  enable_dns_support = true # not sure what this is, but using from example

  tags = merge(
  {
    "Name" = "k8s"
  }
  )
}

resource "aws_subnet" "k8sub1" {
  vpc_id = aws_vpc.k8s.id
  availability_zone = "eu-west-1a"
  cidr_block = "10.20.10.0/24"

  tags = {
    Name = "k8sub1"
  }
}

resource "aws_subnet" "k8sub2" {
  vpc_id = aws_vpc.k8s.id
  availability_zone = "eu-west-1b"
  cidr_block = "10.20.20.0/24"

  tags = {
    Name = "k8sub2"
  }
}

resource "aws_subnet" "k8sub3" {
  vpc_id = aws_vpc.k8s.id
  availability_zone = "eu-west-1c"
  cidr_block = "10.20.30.0/24"

  tags = {
    Name = "k8sub3"
  }
}

//resource "aws_eip" "k8s_ip" {
//  // not adding any parameter. checking if it works
//}
//
//
//resource "aws_internet_gateway" "igw" {
//  vpc_id = aws_vpc.k8s.id
//
//  tags = {
//    Name = "k8s_igw"
//  }
//}
//
//# add a route table to route outbound internet traffic to Internet gateway
//resource "aws_route_table" "rtb_public" {
//  vpc_id = aws_vpc.k8s.id
//  route {
//    cidr_block = "0.0.0.0/0"
//    gateway_id = aws_internet_gateway.igw.id
//  }
//
//}
//
//resource "aws_route_table_association" "rta_subnet_public" {
//  subnet_id = aws_subnet.subnet1.id
//  route_table_id = aws_route_table.rtb_public.id
//}
//
//resource "aws_route_table_association" "rtb_subnet_public" {
//  subnet_id = aws_subnet.subnet2.id
//  route_table_id = aws_route_table.rtb_public.id
//}
//
//resource "aws_route_table_association" "rtc_subnet_public" {
//  subnet_id = aws_subnet.subnet3.id
//  route_table_id = aws_route_table.rtb_public.id
//}