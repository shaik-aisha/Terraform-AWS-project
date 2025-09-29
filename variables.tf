# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# S3
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-terraform-bucket-12345"
}

# RDS
variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "P@ssword123"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

# EFS
variable "efs_name" {
  description = "Name of the EFS filesystem"
  type        = string
  default     = "my-efs"
}

# ALB
variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "my-alb"
}

variable "subnets" {
  description = "Subnets for ALB"
  type        = list(string)
  default     = ["subnet-abc123", "subnet-def456"]  # replace with your subnet IDs
}

