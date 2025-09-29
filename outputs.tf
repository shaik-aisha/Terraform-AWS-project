# ---------------------------
# S3 Bucket
# ---------------------------
output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

# ---------------------------
# EC2 Instance
# ---------------------------
output "ec2_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}

# ---------------------------
# RDS Instance
# ---------------------------
output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.my_rds.endpoint
}

output "rds_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.my_rds.id
}

# ---------------------------
# EFS
# ---------------------------
output "efs_id" {
  description = "ID of the EFS filesystem"
  value       = aws_efs_file_system.my_efs.id
}

# ---------------------------
# ALB
# ---------------------------
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.my_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.my_alb.arn
}

output "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.tg.arn
}
