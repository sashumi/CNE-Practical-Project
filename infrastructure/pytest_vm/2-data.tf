data "aws_vpc" "project2_vpc" {

  tags = {
    Name = "sashumi_project_vpc",
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

data "aws_security_group" "allow_80_from_elb_to_vm" {
  tags = {
    Name = "allow_80_from_elb_to_vm",
    Project = "project2",
    Author = "sashumi"
  }
}



data "aws_subnet" "jenkins_subnet" {

  tags = {
    Name = "jenkins_subnet",
    Project = "project2",
    Author = "sashumi"
  }
}


variable "ami" {
  default = "ami-08bac620dc84221eb"
}