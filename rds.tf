resource "aws_db_instance" "taxi_rds_instance" {
  allocated_storage                   = 20
  max_allocated_storage               = 50
  db_name                             = "taxi"
  identifier                          = "taxi"
  engine                              = "postgres"
  engine_version                      = "14.6"
  instance_class                      = "db.t3.micro"
  ca_cert_identifier                  = "rds-ca-2019"
  username                            = var.db_username
  password                            = var.db_password
  multi_az                            = false
  skip_final_snapshot                 = true
  storage_encrypted                   = true
  storage_type                        = "gp2"
  iam_database_authentication_enabled = false # TODO Pass to true and manage secrets through IAM
  enabled_cloudwatch_logs_exports     = ["postgresql", "upgrade"]
  apply_immediately                   = true
  network_type                        = "IPV4"
  backup_retention_period             = 7
  db_subnet_group_name                = aws_db_subnet_group.private_subnets_group.name
  vpc_security_group_ids              = [aws_security_group.security_group_for_rds.id]
  deletion_protection                 = false
  publicly_accessible                 = true

  tags = local.tags
}

