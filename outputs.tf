# S3 Bucket
output "s3_bucket_name" {
  value       = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket"
}

# RDS Endpoint
output "rds_endpoint" {
  value       = aws_db_instance.my_rds.endpoint
  description = "RDS instance endpoint"
}

# EFS ID
output "efs_id" {
  value       = aws_efs_file_system.my_efs.id
  description = "EFS file system ID"
}

# ALB DNS
output "alb_dns_name" {
  value       = aws_lb.my_alb.dns_name
  description = "ALB DNS name"
}

