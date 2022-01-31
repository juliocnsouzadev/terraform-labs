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

resource "aws_route_table_association" "demo-app-rtb-assoc-01" {
  subnet_id      = aws_subnet.demo-app-subnet-01.id
  route_table_id = aws_route_table.demo-app-route-table-vcp-01.id
}


resource "aws_default_security_group" "default-demo-app-sg-01" {
  vpc_id = aws_vpc.demo-app-vpc-01.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name : "${var.env_prefix}-deafault-security-group-01"
  }
}

resource "aws_instance" "demo-app-instance-01" {
  ami           = var.aws_ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo-app-subnet-01.id
  tags = {
    Name : "${var.env_prefix}-instance-01"
  }
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_default_security_group.default-demo-app-sg-01.id]
  availability_zone           = aws_subnet.demo-app-subnet-01.availability_zone
}

