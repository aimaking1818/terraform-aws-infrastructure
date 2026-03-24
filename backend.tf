terraform {
  backend "s3" {
    bucket         = "dinesh-images-bucket"
    key = "project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}