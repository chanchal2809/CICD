terraform {
  backend "s3" {
    bucket = "backend-tf-demo7839409973"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
  }
}
