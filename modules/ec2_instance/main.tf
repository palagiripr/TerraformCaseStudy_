resource "aws_instance" "myinstance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group_id]
  user_data       = file("./modules/ec2_instance/userdata.sh")


  tags = {
    Name = "myinstance-${count.index}"
  }
}