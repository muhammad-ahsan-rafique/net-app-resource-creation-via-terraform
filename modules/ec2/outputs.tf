output "instance_public_ips" {
  description = "The public IPs of the public instances."
  value       = aws_instance.ec2.*.public_ip
}

output "instance_private_ips" {
  description = "The private IPs of the private instances."
  value       = aws_instance.ec2.*.private_ip
}