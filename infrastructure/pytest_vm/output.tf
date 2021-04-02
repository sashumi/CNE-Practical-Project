### The Ansible inventory file
### inspired from https://www.linkbynet.com/produce-an-ansible-inventory-with-terraform
resource "local_file" "pytest_inventory" {
 content = templatefile("inventory.template",
 {
  pytestvm_ip = aws_instance.pytest_vm.private_ip

 }
 )
 filename = "pytest_inventory"
}