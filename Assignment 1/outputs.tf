output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.EC2.id
}

output "public_ip" {
  description = "Public IP"
  value       = aws_instance.EC2.public_ip
}

output "public_dns" {
  description = "Public DNS"
  value       = aws_instance.EC2.public_dns
}

output "wordpress_url" {
  description = "WordPress URL"
  value       = "http://${aws_instance.EC2.public_ip}"
}
