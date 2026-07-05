variable "aws_region" {
  description = "AWS region where infrastructure will be deployed"

  type = string
}

variable "instance_type" {
  description = "EC2 instance type"

  type = string
}

variable "key_name" {
  description = "SSH Key Pair"

  type = string
}

variable "environment" {
  description = "Deployment environment"

  type = string
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID"
  type        = string
}
