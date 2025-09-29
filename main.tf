# S3
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

# RDS
resource "aws_db_instance" "my_rds" {
  allocated_storage = var.db_allocated_storage
  engine            = "mysql"
  instance_class    = var.db_instance_class
  name              = var.db_name
  username          = var.db_username
  password          = var.db_password
}

# EFS
resource "aws_efs_file_system" "my_efs" {
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

# ALB
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
}

