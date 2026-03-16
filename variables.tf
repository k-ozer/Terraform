variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type = string

}

variable "key_name" {
  type = string
}

variable "ssh_cidr" {
  type = string
}