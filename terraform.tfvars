vpc_id        = "vpc-06ece205fc009f292"

aws_region         = "ap-south-1"

# EC2
ec2_ami            = "ami-0c55b159cbfafe1f0"
ec2_instance_type   = "t2.micro"
ec2_name            = "my-ec2"
ec2_subnet_id       = "subnet-xxxxxxx" # Replace with your subnet

# S3
s3_bucket_name      = "my-terraform-bucket-123"

# RDS
db_identifier       = "my-rds-instance"
db_engine           = "mysql"
db_engine_version   = "8.0"
db_instance_class   = "db.t3.micro"
db_allocated_storage = 20
db_username         = "admin"
db_password         = "Admin123!"
db_subnet_group     = "my-db-subnet-group" # Replace with your RDS subnet group

# EFS
efs_name            = "my-efs"
efs_subnet_ids      = ["subnet-08b40126eb06da05d", "subnet-05faeb7b9498ccdd0" ,"subnet-0f915e104f28d0d46"] # Replace with your EFS subnets

# ALB
alb_name            = "my-alb"
alb_subnets         = ["subnet-08b40126eb06da05d", "subnet-05faeb7b9498ccdd0" ,"subnet-0f915e104f28d0d46"] # Replace with your ALB subnets

# Security Group
security_group_id   = "sg-xxxxxxxx" # Replace with your security group
