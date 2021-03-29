// create vpc,igw,subnet, route table, eip

resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "sashumi_project_vpc",
    Project = "project2",
    Author = "sashumi"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    Name = "sashumi_project_vpc_project_igw",
    Project = "project2",
    Author = "sashumi"
  }
}

#reference https://stackoverflow
#.com/questions/51196693/terraform-how-to-create-multiple-aws-subnets-from
#-one-resource-block
resource "aws_subnet" "jenkins_subnet" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "jenkins_subnet",
    Project = "project2",
    Author = "sashumi"
  }
}


# add a route table to route outbound internet traffic to Internet gateway
resource "aws_route_table" "jenkins_route_table" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }
  tags = {
    Name = "jenkins_route_table",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_route_table_association" "rta_jenkins_subnet" {
  subnet_id = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_route_table.id

}

resource "aws_eip" "jenkins_ip" {
  tags = {
    Name = "jenkins_ip",
    Project = "project2",
    Author = "sashumi"
  }
}

// create elb, subnet,route table

resource "aws_subnet" "elb_subnet" {
  vpc_id = aws_vpc.project_vpc.id
  cidr_block = "10.10.10.0/24"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "elb_subnet",
    Project = "project2",
    Author = "sashumi"
  }
}


# add a route table to route outbound internet traffic to Internet gateway
resource "aws_route_table" "elb_route_table" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }
  tags = {
    Name = "elb_route_table",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_route_table_association" "rta_elb_subnet" {
  subnet_id = aws_subnet.elb_subnet.id
  route_table_id = aws_route_table.elb_route_table.id

}