terraform {
  backend "s3" {
    bucket = "backend-tf-214793289320"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
  }
}
