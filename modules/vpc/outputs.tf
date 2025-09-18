output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public1.id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public2.id
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private1.id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.private2.id
}

