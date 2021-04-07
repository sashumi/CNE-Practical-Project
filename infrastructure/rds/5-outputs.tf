output "prod_rds_hostname" {
  value = module.rds_production.this_db_instance_endpoint
}

output "test_rds_hostname" {
  value = module.rds_test.this_db_instance_endpoint
}
