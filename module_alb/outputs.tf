output alb_name {
  description = "Name of load balancer"
  value       = var.name
}

output alb_arn {
  description = "ARN of Application Load Balancer"
  value       = aws_lb.this.arn
}

output alb_listener_arn {
  description = "ARN of Application Load Balancer Listener"
  value       = "arn:aws:elasticloadbalancing:eu-north-1:724772091868:loadbalancer/app/course-alb/b41e55bcad01feac"
}

output alb_zone_id {
  description = "Zone ID of Application Load balancer"
  value = aws_lb.this.zone_id
}

output alb_dns_name {
  description = "DNS name of Application Load balancer"
  value = aws_lb.this.dns_name
}