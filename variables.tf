variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "subnet cidr"
  default     = "10.0.1.0/24"
}

variable "ami" {
  type        = string
  description = "ami"
  default     = "ami-023b6eace47afd3b4"
}

variable "instance_type" {
  type        = string
  description = "instance type for the ami"
  default     = "t3.micro"

}

variable "s3_bucket" {
  type    = string
  default = "my-s3-tf-demo8279301"
}

variable "ecr_demo" {
  type        = string
  description = " ecr on tf"
  default     = "my_ecr_repo_demo"
}
