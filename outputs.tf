# EC2
output "ec2_instance_id" {
  value       = aws_instance.my_ec2.id
  description = "The ID of the EC2 instance"
}

output "ec2_public_ip" {
  value       = aws_instance.my_ec2.public_ip
  description = "Public IP of the EC2 instance"
}

# S3
output "s3_bucket_name" {
  value       = aws_s3_bucket.my_bucket.id
  description = "Name of the S3 bucket"
}

# RDS
output "rds_endpoint" {
  value       = aws_db_instance.my_rds.endpoint
  description = "RDS endpoint"
}

# EFS
output "efs_id" {
  value       = aws_efs_file_system.efs.id
  description = "EFS filesystem ID"
}

# ALB
output "alb_dns_name" {
  value       = aws_lb.my_alb.dns_name
  description = "ALB DNS name"
}

output "alb_arn" {
  value       = aws_lb.my_alb.arn
  description = "ALB ARN"
}
