provider "aws" {
  access_key = "key"
  secret_key = "secret"
  region     = "us-east-1"
}

resource "aws_vpc" "dev-vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform-vpc-dev-01"
  }
}

resource "aws_subnet" "dev-subnet-01" {
  vpc_id     = aws_vpc.dev-vpc-01.id
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "terraform-dev-subnet-01"
  }
}
