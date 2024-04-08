resource "aws_lb" "myalb" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  

  tags = {
    Name = var.alb_name
  }
}
