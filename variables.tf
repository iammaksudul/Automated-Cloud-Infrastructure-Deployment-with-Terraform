variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "my-unique-bucket-name"
}

variable "instance_type" {
  description = "The type of EC2 instance to use"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
}