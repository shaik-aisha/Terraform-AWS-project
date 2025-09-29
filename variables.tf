# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# EC2
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_name" {
  description = "EC2 instance name tag"
  type        = string
  default     = "my-ec2"
}

# S3
variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-terraform-s3-bucket"
}

# RDS
variable "db_allocated_storage" {
  description = "RDS allocated storage (GB)"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "RDS database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

# EFS
variable "efs_name" {
  description = "EFS name"
  type        = string
  default     = "my-efs"
}

variable "subnet_id" {
  description = "Subnet ID for EFS mount"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "Security group ID for EC2, EFS, and ALB"
  type        = string
  default     = ""
}

# ALB
variable "alb_name" {
  description = "ALB name"
  type        = string
  default     = "my-alb"
}

variable "alb_subnets" {
  description = "List of subnets for ALB"
  type        = list(string)
  default     = []
}
