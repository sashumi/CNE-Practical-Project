resource "aws_instance" "pytest_vm" {

  ami = var.ami
  availability_zone = "eu-west-1c"
  instance_type = "t2.micro"
  key_name = var.machine_key
  vpc_security_group_ids = [
    data.aws_security_group.allow_ssh.id,
    data.aws_security_group.allow_80_from_elb_to_vm.id
  ]
  subnet_id = data.aws_subnet.jenkins_subnet.id

  associate_public_ip_address = true


  root_block_device {
    volume_size = 100
  }
  lifecycle {
    ignore_changes = [
      tags]
  }

  tags = {
    Name = "pytest_vm",
    Project = "project2",
    Author = "sashumi"
  }
}