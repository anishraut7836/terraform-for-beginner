variable "num_1" {
  type = number
  description = "Numbers for function labs"
  default = 88
}

variable "num_2" {
  type = number
  description = "Numbers for function labs"
  default = 73
}

variable "num_3" {
  type = number
  description = "Numbers for function labs"
  default = 52
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "vpc_name" {
  default = "my-vpc"
}

variable "environment" {
    default = "dev"
  
}