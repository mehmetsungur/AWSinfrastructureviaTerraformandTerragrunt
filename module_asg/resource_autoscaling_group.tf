resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = ["subnet-0a7a61bfdd6fc2913", "subnet-04b248ddc5f502ba8", "subnet-01a977e439ced7984"]
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}