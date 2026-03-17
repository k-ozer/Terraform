# AWS region where resources will be deployed
variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

# EC2 instance type to use for the deployment
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

# AMI ID to use for the EC2 instance
variable "ami_id" {
  type = string

}

# Name of the EC2 key pair for SSH access
variable "key_name" {
  type = string
}

# CIDR block allowed for SSH access
variable "ssh_cidr" {
  type = string
}