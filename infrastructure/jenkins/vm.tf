// jenkins instance,eip
// sg: ssh-sg,pub-elb,elb-vm

resource "aws_security_group" "ssh_sg" {
  name = "ssh_sg"
  description = "Allow traffic to jenkins"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "22 from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block,
      "130.43.176.247/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_security_group" "allow_80_public_to_elb" {
  name = "allow_80_public_to_elb"
  description = "Allow traffic to jenkins"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "allow_80_public_to_elb"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block,
      "130.43.176.247/32",
      //https://github.blog/changelog/2019-04-09-webhooks-ip-changes/
      "140.82.112.0/20"
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80_public_to_elb",
    Project = "project2",
    Author = "sashumi"
  }
}

resource "aws_security_group" "allow_80_from_elb_to_vm" {
  name = "allow_80_from_elb_to_vm"
  description = "allow ELB to connect to port 80 of instance only"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "allow_80_from_elb_to_vm"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      aws_vpc.project_vpc.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80_from_elb_to_vm",
    Project = "project2",
    Author = "sashumi"
  }
}


resource "aws_instance" "jenkins" {

  ami = var.ami
  availability_zone = "eu-west-1c"
  instance_type = "t2.small"
  key_name = aws_key_pair.jenkins_keypair.key_name
  vpc_security_group_ids = [
    aws_security_group.allow_80_from_elb_to_vm.id,
    aws_security_group.ssh_sg.id
  ]
  subnet_id = aws_subnet.jenkins_subnet.id

  tags = {
    Name = "jenkins vm",
    Project = "project2",
    Author = "sashumi"
  }

  root_block_device {
    volume_size = 50
  }

}

resource "aws_eip_association" "jenkins_ip" {
  depends_on = [
    aws_internet_gateway.project_igw]
  instance_id = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins_ip.id
}


resource "aws_elb" "jenkins_elb" {
  name = "jenkins-elb"

  subnets = [
    aws_subnet.elb_subnet.id
  ]

  security_groups = [
    aws_security_group.allow_80_public_to_elb.id]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:80"
    interval = 30
  }

  instances = [
    aws_instance.jenkins.id]

  cross_zone_load_balancing = false
  idle_timeout = 300
  connection_draining = true
  connection_draining_timeout = 300

  tags = {
    Name = "jenkins_elb",
    Project = "project2",
    Author = "sashumi"
  }
}