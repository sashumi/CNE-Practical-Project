//create key pair,eip,instance,block device, eip association

//resource "aws_key_pair" "jenkins_keypair" {
//  key_name = "jenkins_keypair"
//  public_key = var.ssh_pubkey
//}



resource "aws_instance" "jenkins" {
  ami = var.ami
  availability_zone = aws_subnet.subnet1.availability_zone
  instance_type = "t2.micro"
  key_name = aws_key_pair.jenkins_keypair.key_name
  vpc_security_group_ids = [
    aws_security_group.jenkins_sg_22.id,
    aws_security_group.jenkins_sg_80.id
  ]
  subnet_id = aws_subnet.subnet1.id

  tags = {
    Name = "jenkins vm"
  }

  root_block_device {
    volume_size = 100
  }
}

resource "aws_eip_association" "jenkins_ip" {
  depends_on = [
    # this part was failing when igw was taking time
    # so as per tutorial below, adding dependency
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
    aws_internet_gateway.igw,
    aws_instance.jenkins,
    aws_eip.jenkins_ip]
  instance_id = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins_ip.id
}

//resource "null_resource" "install_jenkins" {
//
//  depends_on = [
//    aws_eip_association.jenkins_ip]
//
//  connection {
//    type = "ssh"
//    user = "ubuntu"
//    host = aws_eip.jenkins_ip.public_ip
//    private_key = file("jenkins_keypair")
//    timeout = 60
//
//  }

  //  provisioner "file" {
  //    source = "ansible/inventory"
  //    destination = "/tmp/inventory"
  //  }

//  provisioner "file" {
//    source = "ansible/play.yml"
//    destination = "/tmp/play.yml"
//  }
//
//  provisioner "remote-exec" {
//    inline = [
//      "sudo apt -y update && sudo apt -y install ansible && ansible-playbook -i /tmp/inventory /tmp/play.yml"
//    ]
//  }
