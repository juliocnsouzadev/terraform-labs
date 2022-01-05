provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_vpc" "demo-app-vpc-01" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc-01"
  }
}

resource "aws_subnet" "demo-app-subnet-01" {
  vpc_id     = aws_vpc.demo-app-vpc-01.id
  cidr_block = var.subnet_cidr_block
  tags = {
    Name : "${var.env_prefix}-subnet-01"
  }
}

resource "aws_internet_gateway" "demo-app-igw-01" {
  vpc_id = aws_vpc.demo-app-vpc-01.id
  tags = {
    Name : "${var.env_prefix}-igw-01"
  }
}

resource "aws_route_table" "demo-app-route-table-vcp-01" {
  vpc_id = aws_vpc.demo-app-vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-app-igw-01.id
  }
  tags = {
    Name : "${var.env_prefix}-route-table-01"
  }
}
