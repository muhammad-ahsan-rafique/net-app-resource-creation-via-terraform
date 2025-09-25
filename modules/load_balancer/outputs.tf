output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.main.dns_name
}

output "lb_arn" {
  description = "The ARN of the load balancer."
  value       = aws_lb.main.arn
}

output "target_group_arn" {
  description = "The ARN of the target group."
  value       = aws_lb_target_group.main.arn
}