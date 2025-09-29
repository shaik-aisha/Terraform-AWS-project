provider "aws" {
  region = var.aws_region
}

###########################
# S3 Bucket
###########################
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  # acl is deprecated, use aws_s3_bucket_acl if needed
}

###########################
# EC2 Instance
###########################
resource "aws_instance" "my_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.ec2_subnet_id
  tags = {
    Name = var.ec2_name
  }
}

###########################
# RDS Instance
###########################
resource "aws_db_instance" "my_rds" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  identifier           = var.db_name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.db_subnet_group
}

###########################
# EFS
###########################
resource "aws_efs_file_system" "my_efs" {
  creation_token = var.efs_name
  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  for_each       = toset(var.efs_subnet_ids)
  file_system_id = aws_efs_file_system.my_efs.id
  subnet_id      = each.value
  security_groups = [var.security_group_id]
}

###########################
# ALB
###########################
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.alb_subnets
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.alb_name}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_subnet.selected[var.alb_subnets[0]].vpc_id
  target_type = "instance"
}

###########################
# Data blocks for existing subnets
###########################
data "aws_subnet" "selected" {
  for_each = toset(var.alb_subnets)
  id       = each.value
}
