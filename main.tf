resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc created on terraform"
  }
}

resource "aws_subnet" "my-pubsubnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_public_subnet"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my_igw"
  }
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "puc_assoc" {
  subnet_id      = aws_subnet.my-pubsubnet.id
  route_table_id = aws_route_table.my_rt.id
}

resource "aws_security_group" "my_sg" {
  name   = "allow ssh"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http_https"
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my-pubsubnet.id
  security_groups = [
    aws_security_group.my_sg.id
  ]

  tags = {
    Name = "ec2_instance"
  }
}

resource "aws_s3_bucket" "my-s3-tf" {
  bucket = var.s3_bucket

  tags = {
    Name = "my-s3-bucket-tf-demo"
  }
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = var.ecr_demo
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "my_ecr_repo_demo"
  }
}