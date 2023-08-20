# API
resource "aws_lb_target_group" "tg_ecs_fg_dev1_api" {
  name                  = "${var.project_code}-tg-ecs-fg-dev1-api"
  port                  = 443
  protocol              = "HTTPS"
  target_type           = "ip"
  vpc_id                = var.aws_vpc_id
  deregistration_delay  = 60

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/api/v1/status"
    protocol            = "HTTPS"
    port                = 443
    matcher             = 200
  }

  stickiness {
    enabled = true
    type = "lb_cookie"
  }

  tags = {
    Name                = "${var.project_code}-tg-ecs-fg-dev1-api"
    Environment_Name    = "dev1"
    Service_Name        = "api"
    Project_Name        = var.project_name
    Appplication_Name   = var.application_name
  }

}


# UI
resource "aws_lb_target_group" "tg_ecs_fg_dev1_ui" {
  name                  = "${var.project_code}-tg-ecs-fg-dev1-ui"
  port                  = 443
  protocol              = "HTTPS"
  target_type           = "ip"
  vpc_id                = var.aws_vpc_id
  deregistration_delay  = 60

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    protocol            = "HTTPS"
    port                = 443
    matcher             = 200
  }

  stickiness {
    enabled = true
    type = "lb_cookie"
  }

  tags = {
    Name                = "${var.project_code}-tg-ecs-fg-dev1-ui"
    Environment_Name    = "dev1"
    Service_Name        = "ui"
    Project_Name        = var.project_name
    Appplication_Name   = var.application_name
  }

}