module "rds_test" {
  # Using community published Terraform Modules available from terraform
  # module registry - https://registry.terraform.io/namespaces/terraform-aws-modules
  source = "terraform-aws-modules/rds/aws"

  identifier = "prj2-rds-test"

  engine = "mysql"
  engine_version = "5.7"
  family = "mysql5.7"

  major_engine_version = "5.7"
  # DB option group
  instance_class = "db.t2.micro"

  allocated_storage = 20
  max_allocated_storage = 100
  storage_encrypted = false

  name = "prj2rdstest"
  # using TF_VAR method as described on
  # https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1
  username = var.username
  password = var.password
  port = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"
  enabled_cloudwatch_logs_exports = [
    "general"]

  multi_az = false
  subnet_ids = [
    aws_subnet.rds_subnet1.id,
    aws_subnet.rds_subnet2.id,
    aws_subnet.rds_subnet3.id]
  vpc_security_group_ids = [
    aws_security_group.rds_sg.id]

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }

}


module "rds_production" {
  # Using community published Terraform Modules available from terraform
  # module registry - https://registry.terraform.io/namespaces/terraform-aws-modules
  source = "terraform-aws-modules/rds/aws"

  identifier = "prj2-rds-production"

  engine = "mysql"
  engine_version = "5.7"
  family = "mysql5.7"
  major_engine_version = "5.7"
  # DB option group
  instance_class = "db.t2.micro"

  allocated_storage = 20
  max_allocated_storage = 100
  storage_encrypted = false

  name = "prj2rdsproduction"
  # using TF_VAR method as described on
  # https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1
  username = var.username
  password = var.password
  port = 3306

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"
  enabled_cloudwatch_logs_exports = [
    "general"]

  multi_az = true
  subnet_ids = [
    aws_subnet.rds_subnet1.id,
    aws_subnet.rds_subnet2.id]
  vpc_security_group_ids = [
    aws_security_group.rds_sg.id]

  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}
