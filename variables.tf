variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

# EC2
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ec2_name" {
  type    = string
  default = "My-first-terraform-EC2"
}

# S3
variable "s3_bucket_name" {
  type    = string
  default = "My-first-terraform-S3"
}

# RDS
variable "db_name" {
  type    = string
  default = "My-first-terraform-RDS"
}
variable "db_allocated_storage" {
  type    = number
  default = 20
}
variable "db_engine" {
  type    = string
  default = "mysql"
}
variable "db_engine_version" {
  type    = string
  default = "8.0"
}
variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}
variable "db_username" {
  type    = string
  default = "admin"
}
variable "db_password" {
  type    = string
  default = "Password123!"
}

# EFS
variable "efs_name" {
  type    = string
  default = "My-first-terraform-EFS"
}
variable "subnet_id" {
  type = string
}
variable "security_group_id" {
  type = string
}

# ALB
variable "alb_name" {
  type    = string
  default = "My-first-terraform-ALB"
}
variable "alb_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
