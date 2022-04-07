variable "env_prefix" {
  description = "Environment prefix"
}

variable "my_ip" {
  description = "My IP address"
}

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

variable "vpc_cidr_block" {
  description = "value for vpc cidr_block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "value for subnet cidr_block"
  type        = string
}

variable "aws_ami_id" {
  description = "value for aws ami id"
  type        = string
}

variable "instance_type" {
  description = "value for instance type"
  type        = string
}

variable "public_key_location" {
  description = "value for public key location"
  type        = string
}
