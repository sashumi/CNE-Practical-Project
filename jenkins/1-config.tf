terraform {
  backend "s3" {
    bucket = "shamsi-project2"
    key    = "jenkins.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}