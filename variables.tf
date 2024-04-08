variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "alb_name" {
  description = "Name for ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "http_port" {
  
  type        = string
}
variable "vpc_id" {

}

