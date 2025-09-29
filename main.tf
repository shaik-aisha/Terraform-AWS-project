provider "aws" {
  region = var.aws_region
}

###########################
# S3 Bucket
###########################
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
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
# RDS Database
###########################
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.alb_subnets  # or create a separate variable for DB subnets

  tags = {
    Name = "${var.db_identifier}-subnet-group"
  }
}

resource "aws_db_instance" "my_rds" {
  identifier             = var.db_identifier
  allocated_storage      = var.db_allocated_storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  skip_final_snapshot    = true
}

###########################
# EFS Filesystem
###########################
resource "aws_efs_file_system" "efs" {
  creation_token = var.efs_name
}

resource "aws_efs_mount_target" "efs_mount" {
  for_each       = toset(var.efs_subnet_ids)
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = each.value
  security_groups = [var.security_group_id]
}

###########################
# Application Load Balancer
###########################
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = var.alb_subnets
  security_groups    = [var.security_group_id]
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

###########################
# Outputs
###########################
output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}

output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}
