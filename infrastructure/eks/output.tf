output "subnet_list" {
  value = [
    aws_subnet.eks_subnet1.id,
    aws_subnet.eks_subnet2.id,
    aws_subnet.eks_subnet3.id,]
}
