resource "aws_lb" "main" {
  name                       = "${var.project_name}-${var.env}-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = var.security_group_ids
  subnets                    = var.public_subnet_ids
  enable_deletion_protection = false

  tags = var.tags
}

resource "aws_lb_target_group" "main" {
  name        = "${var.project_name}-${var.env}-tg"
  port        = var.target_group_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    port                = var.target_group_port
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

  tags = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}