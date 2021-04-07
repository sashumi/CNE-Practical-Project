terraform {
  backend "s3" {
    bucket = "shamsi-project2"
    key = "project2/product.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

data "aws_instance" "pytest_vm" {

  filter {
    name = "tag:Name"
    values = [
      "pytest_vm"]
  }
  filter {
    name = "tag:Project"
    values = [
      "project2"]
  }
  filter {
    name = "tag:Author"
    values = [
      "sashumi"]
  }

}

resource "local_file" "pytest_inventory" {
  content = templatefile("test_inventory.template",
  {
    pytestvm_ip = data.aws_instance.pytest_vm.private_ip

  }
  )
  filename = "test_inventory"
}
