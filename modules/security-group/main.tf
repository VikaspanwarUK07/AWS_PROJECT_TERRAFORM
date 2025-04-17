resource "aws_security_group" "alb_sg" {
    name = "alb security group"
    description = "enable http acces port 80"
    vpc_id = var.vpc_id


    dynamic "ingress" {
        for_each = var.ports
        iterator = port
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        } 
    }

    egress  {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      name = "alb_sg"
    }
}
resource "aws_security_group" "sg-db" {
    ingress  {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      name = "database_sg"
    }
}