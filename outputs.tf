output "ec2_id" {
  value = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}

output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}
