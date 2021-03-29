terraform {
  backend "s3" {
    bucket = "shamsi-project2"
    key    = "
    cluster/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}
