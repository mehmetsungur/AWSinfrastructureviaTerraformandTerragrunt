# HTTP Listener (Port 80)
resource "aws_lb_listener" "http" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:eu-north-1:724772091868:loadbalancer/app/course-alb/b41e55bcad01feac"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# HTTPS Listener (Port 443)
resource "aws_lb_listener" "https" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:eu-north-1:724772091868:loadbalancer/app/course-alb/b41e55bcad01feac"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:eu-north-1:724772091868:certificate/b285fc63-50c3-45a8-a402-90ae66f7d0cc"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}