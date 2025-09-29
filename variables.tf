variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_name" {
  description = "EC2 instance Name tag"
  type        = string
  default     = "my-ec2"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 (replace if needed)
}

variable "ec2_subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
  default     = "" # Provide your existing subnet ID
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "my-terraform-bucket-123"
}

variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "my-rds-instance"
}

variable "db_engine" {
  description = "RDS engine"
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
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  default     = "Admin123!"
}

variable "db_subnet_group" {
  description = "RDS Subnet Group Name"
  type        = string
  default     = "" # Provide your existing DB subnet group
}

variable "efs_name" {
  description = "EFS filesystem name"
  type        = string
  default     = "my-efs"
}

variable "efs_subnet_ids" {
  description = "List of subnet IDs for EFS mount targets"
  type        = list(string)
  default     = []
}

variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "my-alb"
}

variable "alb_subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
  default     = []
}

variable "security_group_id" {
  description = "Security group ID for EC2, ALB, EFS"
  type        = string
  default     = ""
}
