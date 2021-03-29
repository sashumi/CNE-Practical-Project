terraform {
  # using specified version as best practice
  //  required_version = ">= 0.14.8"

  # provider versions also need to be in here
  # see https://www.terraform.io/docs/language/providers/requirements.html
  //  required_providers {
  //    aws = {
  //      version = ">= 3.33.0"
  //    }
  //  }


  backend "s3" {
    bucket = "shamsi-project2"
    key = "jenkins.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_key_pair" "jenkins_keypair" {
  key_name = "jenkins_keypair"
  public_key = var.ssh_pubkey
}

