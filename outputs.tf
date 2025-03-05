output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_instance.id
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.my_security_group.id
}

output "iam_role_name" {
  description = "The name of the IAM Role"
  value       = aws_iam_role.my_role.name
}