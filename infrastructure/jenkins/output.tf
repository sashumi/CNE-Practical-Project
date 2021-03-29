output "jenkins_ip" {
  value = aws_eip.jenkins_ip.public_ip
}



### The Ansible inventory file
### inspired from https://www.linkbynet.com/produce-an-ansible-inventory-with-terraform
resource "local_file" "jenkins_inventory" {
 content = templatefile("inventory.template",
 {
  jenkins_ip = aws_eip.jenkins_ip.public_ip,
  jenkins_elb = aws_elb.jenkins_elb.dns_name,

 }
 )
 filename = "jenkins_inventory"
}