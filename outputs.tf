output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.my_bucket.id
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.my_rds.endpoint
}

output "efs_id" {
  description = "EFS ID"
  value       = aws_efs_file_system.my_efs.id
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.my_alb.dns_name
}
