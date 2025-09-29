provider "aws" {
  region = var.aws_region
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  # acl is deprecated, consider using aws_s3_bucket_acl
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # change to valid AMI in your region
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_name
  }
}

# RDS Instance
resource "aws_db_instance" "my_rds" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = "admin"
  password             = "Admin123!"  # replace with secrets in production
  skip_final_snapshot  = true
}

# EFS
resource "aws_efs_file_system" "my_efs" {
  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  file_system_id  = aws_efs_file_system.my_efs.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
}

# ALB
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.alb_subnets
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.subnet_id
}
