resource "aws_lb_target_group" "this" {
  name                 = "${local.name}-tg"
  port                 = 80
  protocol             = "HTTP"
  
  vpc_id               = "vpc-0c60664ec6164de45"
  target_type = "instance"

  health_check  {
      path            = var.tg_health_path
      port            = var.tg_health_port
      protocol        = var.tg_health_protocol   
      matcher         = var.tg_health_matcher
      timeout         = var.tg_health_timeout
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${local.name}-tg",
    Environment = var.environment
  }

}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.name
  lb_target_group_arn    = aws_lb_target_group.this.arn
}