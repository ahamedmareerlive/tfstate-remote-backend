provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "abhishek" {
  instance_type = "t2.micro"
  ami = "ami-020cba7c55df1f615" # change this
  subnet_id = "subnet-02a41a252d09a2d23" # change this
}

 resource "aws_s3_bucket" "s3_bucket" {
  bucket = "mareer-s3-demo-xyz" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
} 

# FIRST CREATE S3 AND aws_dynamodb_table
# THEN CREATE backend.tf and configure it, remove the  S3 AND aws_dynamodb_table from main.tf CODE
# BECAUSE IF WE AGAIN GIVE terraform apply IT WILL TRY TO CREATE BOTH AGAIN AND WILL GIVE AN ERROR 
# NOW ADD THE CODE FOR INSTANCE RESOURCE