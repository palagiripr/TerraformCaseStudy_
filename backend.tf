terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-prathyusha"
    key            = "tf-state-casestudy/terraform.tfstate"
    region         = "us-east-1"
    
  }
}