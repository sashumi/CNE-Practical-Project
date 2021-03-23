resource "aws_key_pair" "jenkins_keypair" {
  key_name = "jenkins_keypair"
  public_key = var.ssh_pubkey
}

resource "aws_eip" "jenkins_ip" {
  // not adding any parameter. checking if it works
}

resource "aws_instance" "jenkins" {
  ami = var.ami
  availability_zone = aws_subnet.subnet1.availability_zone
  instance_type = "t2.micro"
  key_name = aws_key_pair.jenkins_keypair.key_name
  vpc_security_group_ids = [
    aws_security_group.jenkins_sg_22.id,
    aws_security_group.jenkins_sg_80.id]
  subnet_id = aws_subnet.subnet1.id

  tags = {
    Name = "jenkinsvm"
  }

  root_block_device {
    volume_size = 100
  }
}

resource "aws_eip_association" "jenkins_ip" {
  instance_id = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins_ip.id
}