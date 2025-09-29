provider "aws" {
  region = var.aws_region
}

# ------------------ S3 Bucket ------------------
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

# ------------------ EC2 ------------------
resource "aws_instance" "my_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.ec2_subnet_id

  tags = {
    Name = var.ec2_name
  }
}

# ------------------ RDS ------------------
resource "aws_db_instance" "my_rds" {
  identifier          = var.db_identifier
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  allocated_storage   = var.db_allocated_storage
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = var.db_subnet_group
  skip_final_snapshot  = true
}

# ------------------ EFS ------------------
resource "aws_efs_file_system" "efs" {
  creation_token = var.efs_name
  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  for_each        = toset(var.efs_subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = [var.security_group_id]
}

# ------------------ ALB ------------------
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
  vpc_id   = var.alb_subnets[0] != "" ? data.aws_subnet.selected[0].vpc_id : "" 
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

# ------------------ Data Sources ------------------
data "aws_subnet" "selected" {
  id = var.alb_subnets[0]
}
