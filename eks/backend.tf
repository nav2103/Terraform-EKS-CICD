terraform {
  backend "s3" {
    bucket = "myawseksbucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-2"
  }
}