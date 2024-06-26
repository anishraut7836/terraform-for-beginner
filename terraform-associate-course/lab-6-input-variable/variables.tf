/***
variable "aws_region" {
  type        = string
  description = "region used to deploy workloads"
  default     = "us-east-1"
  validation {
    condition     = can(regex("^us-", var.aws_region))
    error_message = "The aws_region value must be a valid region in the
    USA, starting with \"us-\"."
  }
}
***/
variable "vpc" {
  type    = string
  default = "vpc-01bc5eddb8ddc1e95"
}


variable "variables_sub_cidr" {
  description = "CIDR Block for the Variables Subnet. Example: 10.0.1.0/24"
  type        = string
  default     = "10.0.202.0/24"
}

variable "variables_sub_az" {
  description = "Availability Zone used Variables Subnet. Example: us-east-1a|us-east2a"
  type        = string
  default     = "us-east-1a"
}

variable "variables_sub_auto_ip" {
  description = "Set Automatic IP Assigment for Variables Subnet. Example: true|false"
  type        = bool
  default     = true
}