variable "vpc_id" {
  type = string
  default = "vpc-id"
}

variable "us-east-1-azs" {
    type = list(string)
    default = [
        "us-east-1a",
        "us-east-1b",
        "us-east-1c",
        "us-east-1d",
        "us-east-1e"
    ]
}

variable "ip" {
  type = map(string)
  default = {
    prod = "10.0.150.0/24"
    dev  = "10.0.250.0/24"
  }
}