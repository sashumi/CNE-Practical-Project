resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  description = "allow database traffic within VPC"
  vpc_id = data.aws_vpc.project2_vpc.id

  ingress {
    description = "3306 from VPC"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [
      data.aws_vpc.project2_vpc.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_subnet" "rds_subnet1" {
  vpc_id = data.aws_vpc.project2_vpc.id
  cidr_block = "10.10.5.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "rds_subnet_1",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_subnet" "rds_subnet2" {
  vpc_id = data.aws_vpc.project2_vpc.id
  cidr_block = "10.10.6.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "rds_subnet_2",
    Project = "project2",
    Author = "sashumi"
  }
}



resource "aws_subnet" "rds_subnet3" {
  vpc_id = data.aws_vpc.project2_vpc.id
  cidr_block = "10.10.7.0/24"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "rds_subnet_3",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_route_table" "rds_route_table" {
  vpc_id = data.aws_vpc.project2_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.project_igw.id
  }
  tags = {
    Name = "rds_route_table",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_route_table_association" "rta_jenkins_subnet1" {
  subnet_id = aws_subnet.rds_subnet1.id
  route_table_id = aws_route_table.rds_route_table.id

}

resource "aws_route_table_association" "rta_jenkins_subnet2" {
  subnet_id = aws_subnet.rds_subnet2.id
  route_table_id = aws_route_table.rds_route_table.id

}

resource "aws_route_table_association" "rta_jenkins_subnet3" {
  subnet_id = aws_subnet.rds_subnet3.id
  route_table_id = aws_route_table.rds_route_table.id

}
