resource "aws_lb" "this" {
    name               = "${var.name_prefix}-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = ["sg-00faade8433e09ab0"]
    subnets            = var.subnets
    enable_deletion_protection = var.enable_deletion_protection_flag

    tags = {
        Name = "${var.name_prefix}-lb",
        Environment = var.environment
    }
}