provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
}

# Create a Security Group
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-security-group-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an IAM Role
resource "aws_iam_role" "my_role" {
  name = "my-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Attach a Policy to the IAM Role
resource "aws_iam_role_policy" "my_role_policy" {
  name   = "my-role-policy"
  role   = aws_iam_role.my_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = [
          aws_s3_bucket.my_bucket.arn,
          "${aws_s3_bucket.my_bucket.arn}/*"
        ]
      },
    ]
  })
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.my_instance_profile.id

  tags = {
    Name = "MyInstance"
  }
}

# Create an IAM Instance Profile
resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "my-instance-profile"
  role = aws_iam_role.my_role.name
}