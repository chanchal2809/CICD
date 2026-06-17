output "vpc_id" {
  description = "id of the vpc"
  value       = aws_vpc.my-vpc.id
}

output "subnet_id" {
  description = "id of the subnet"
  value       = aws_subnet.my-pubsubnet.id
}

output "sg_id" {
  description = "id of the sg"
  value       = aws_security_group.my_sg.id
}

output "aws_ec2" {
  value = aws_instance.my_ec2_instance.id
}

output "aws_s3" {
  value = aws_s3_bucket.my-s3-tf.bucket
}

output "aws_ecr" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}