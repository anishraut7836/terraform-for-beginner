variable "ec2_instance_type" {
  type        = string
  default     = "t3a.small" #change the value and apply to see the error.
  description = "Specify the instance type to be used"

  validation {
    condition     = can(regex("^[Tt][2-3].(nano|micro|small)", var.ec2_instance_type))
    error_message = "Invalid instance type name. Only t2.nano, t2.mico, t2.small is allowd"
  }

}

variable "image_id" {
  type = string
  default = "ami-0d980397a6e8935cd"  #change the ami- word with some other word to see the error
  description = "Specify the AMI ID"

  validation {
    condition = length(var.image_id) > 4 && substr(var.image_id,0,4) == "ami-"
    error_message = "The image id must be start with ami- value"
  }
}