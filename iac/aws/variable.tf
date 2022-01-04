variable "aws_access_key" {
  description = "AWS Access key"
}

variable "aws_secret_key" {
  description = "AWS Secret key"
}

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "env_prefix" {
  description = "Environment prefix"
}

variable "vpc_cidr_block" {
  description = "value for vpc cidr_block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "value for subnet cidr_block"
  type        = string
}
