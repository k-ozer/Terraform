# Output the EC2 instance ID
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.EC2.id
}

# Output the public IP address of the EC2 instance
output "public_ip" {
  description = "Public IP"
  value       = aws_instance.EC2.public_ip
}

# Output the public DNS name of the EC2 instance
output "public_dns" {
  description = "Public DNS"
  value       = aws_instance.EC2.public_dns
}

# Output the WordPress URL for accessing the application
output "wordpress_url" {
  description = "WordPress URL"
  value       = "http://${aws_instance.EC2.public_ip}"
}
