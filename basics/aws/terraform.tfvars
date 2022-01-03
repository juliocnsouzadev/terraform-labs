aws_region = "us-east-1"

subnet_cidr_block = "10.0.10.0/24"
subnet_cidr_blocks = [
  {
    cidr_block = "10.0.0.0/16"
    name       = "terraform-vpc-dev-01"
  },
  {
    cidr_block = "10.0.10.0/24"
    name       = "terraform-dev-subnet-01"
  }
]
