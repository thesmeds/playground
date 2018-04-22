variable "aws_region" {
  description = "The AWS region."
  type        = "string"
  default     = "us-west-2"
}

variable "aws_account_ids" {
  description = "The white listed AWS account ID(s)."
  type        = "list"
}

variable "key_name" {
  description = "SSH key used to access the instance."
  type        = "string"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for public subnet."
  type        = "string"
  default     = "10.0.0.0/24"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = "string"
  default     = "10.0.0.0/16"
}

variable "whitelist_ips" {
  description = "The IP(s) granted access to the instance."
  type        = "list"
}
