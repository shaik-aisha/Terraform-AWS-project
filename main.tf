provider "aws" {
  region = var.aws_region
}

# ------------------
# S3 Bucket
# ------------------
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

# ------------------
# EC2 Instance
# ------------------
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type
  tags = {
    Name = var.ec2_name
  }
}

# ------------------
# RDS Instance
# ------------------
resource "aws_db_instance" "my_rds" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = false
  skip_final_snapshot  = true
}

# ------------------
# EFS
# ------------------
resource "aws_efs_file_system" "my_efs" {
  creation_token = var.efs_name
}

resource "aws_efs_mount_target" "efs_mount" {
  file_system_id  = aws_efs_file_system.my_efs.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
}

# ------------------
# Application Load Balancer
# ------------------
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
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
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
