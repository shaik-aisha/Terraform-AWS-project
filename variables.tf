# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# S3 Bucket Creation 
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-firstterraform-bucket"
}

# RDS
variable "db_name" {
  description = "my-first-terraform-db"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "admin"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "admin123"
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
  description = "my-first-terraform-efs"
  type        = string
  default     = "my-efs"
}

# ALB
variable "alb_name" {
  description = "my-first-terraform-alb"
  type        = string
  default     = "my-alb"
}

variable "subnets" {
  description = "Subnets for ALB"
  type        = list(string)
  default     = ["subnet-08b40126eb06da05d" , "subnet-05faeb7b9498ccdd0", "subnet-0f915e104f28d0d46"]  # replace with your subnet IDs
}

