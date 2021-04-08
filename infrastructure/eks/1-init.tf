terraform {
  backend "s3" {
    bucket = "shamsi-project2"
    key = "project2/eks.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "project2_vpc" {

  tags = {
    Name = "sashumi_project_vpc",
    Project = "project2",
    Author = "sashumi"
  }

}

data "aws_internet_gateway" "project_igw" {
  tags = {
    Name = "sashumi_project_vpc_project_igw",
    Project = "project2",
    Author = "sashumi"
  }
}


data "aws_security_group" "allow_ssh" {
  tags = {
    Name = "allow_ssh",
    Project = "project2",
    Author = "sashumi"
  }
}
