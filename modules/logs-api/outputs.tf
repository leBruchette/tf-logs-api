output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.logs_api_instance.id
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.logs_api_instance.public_ip
}

output "public_dns" {
  description = "The public DNS name of the instance"
  value       = aws_instance.logs_api_instance.public_dns
}