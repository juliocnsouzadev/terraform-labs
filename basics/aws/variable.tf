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

variable "subnet_cidr_blocks" {
  description = "value for cidr_blocks"
  type = list(object({
    cidr_block = string
    name       = string
  }))
}
