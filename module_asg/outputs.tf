output launch_template_name {
    description = "Name of Launch template"
    value = aws_launch_template.this.name
}

output autoscaling_group_name {
    description = "Name of autoscaling group"
    value = aws_autoscaling_group.this.name
}

output public_key {
    description = "Public key for connection to EC2 instances on ASG"
    value = tls_private_key.this.public_key_openssh
}

output alb_listener_arn {
  value = "arn:aws:elasticloadbalancing:eu-north-1:724772091868:loadbalancer/app/course-alb/b41e55bcad01feac"
}

output arn {
  value = "arn:aws:kms:eu-north-1:724772091868:key/4b8f2f8d-7e87-4b51-8670-6a4f59abd8e1"
}