terraform {
  backend "s3" {
    bucket         = "mareer-s3-demo-xyz" # change this
    key            = "mareer/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
} 