resource "aws_vpc" "jenkins" {

  cidr_block = "10.10.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = merge(
  {
    "Name" = "jenkins"
  }
  )
}