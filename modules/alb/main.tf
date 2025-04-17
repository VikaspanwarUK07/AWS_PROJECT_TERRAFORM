resource "aws_alb" "application_load_balancer" {
    name = "${var.project_name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = var.aws_alb
    subnets = [var.pub_sub_1a_id , var.pub_sub_2b_id]

    tags = {
      name= "${var.project_name}-alb"
    }
}

resource "aws_alb_target_group" "alb_target_group" {
    name = "${var.project_name}"
    target_type = "instance"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}