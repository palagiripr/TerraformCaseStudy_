provider "aws" {
  region = var.aws_region
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  subnet_ids        = var.subnet_ids
  security_group_id = var.security_group_id
}

module "ec2_instances" {
  source              = "./modules/ec2_instance"
  instance_count      = 2
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_ids          = var.subnet_ids
  security_group_id   = var.security_group_id
  
}
resource "aws_lb_target_group" "tg-ec2" {
  name        = "tf-case-study-tg"
  vpc_id      = var.vpc_id
  target_type = "instance"
  port        = var.http_port
  protocol    = "HTTP"
}

resource "aws_lb_target_group_attachment" "tf_cs_tg_attchment" {
  for_each = {
    for k,v in module.ec2_instances.instance_ids:
    k => v
  }
  target_group_arn = aws_lb_target_group.tg-ec2.arn
  target_id        = each.value
  depends_on       = [module.ec2_instances]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = module.alb.alb_arn
  port              = var.http_port
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-ec2.arn
  }
  depends_on = [module.alb]
}