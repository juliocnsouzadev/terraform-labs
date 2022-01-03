provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_vpc" "dev-vpc-01" {
  cidr_block = var.subnet_cidr_blocks[0].cidr_block
  tags = {
    Name = var.subnet_cidr_blocks[0].name
  }
}

output "dev-vpc-01-output" {
  value = aws_vpc.dev-vpc-01.id
}

resource "aws_subnet" "dev-subnet-01" {
  vpc_id     = aws_vpc.dev-vpc-01.id
  cidr_block = var.subnet_cidr_blocks[1].cidr_block
  tags = {
    Name = var.subnet_cidr_blocks[1].name
  }
}

output "dev-subnet-01-output" {
  value = aws_subnet.dev-subnet-01.id
}
