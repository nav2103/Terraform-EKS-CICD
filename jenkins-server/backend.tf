terraform {
  backend "s3" {
    bucket = "myawseksbucket"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}