output "instance_ids" {
  value = aws_instance.myinstance[*].id
}