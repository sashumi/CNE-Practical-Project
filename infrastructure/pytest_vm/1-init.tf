terraform {
  backend "s3" {
    bucket = "shamsi-project2"
    key = "project2/phase2.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

variable "machine_key" {
  default = "jenkins_keypair"
}