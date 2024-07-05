variable "cloud" {
  type = string
  description = "Only value allowed aws, azure, gcp, vmware.also in lower letter."
  #Validate the input based on the below list. if input is other than then it will give the error.
  validation {
    condition = contains(["aws", "azure", "gcp", "vmware"], lower(var.cloud))
    error_message = "You must use an approved cloud."
  }

  #Validating the Input if input given in Caps letters then it will promt the error message. 
  validation {
    condition = lower(var.cloud) == var.cloud
    error_message = "The cloud name must not have capital letters."
  }
}

#Validating the Input if input given in Caps letters then it will promt the error message. 
variable "no_caps" {
  type = string
  description = "Input value is allowed in lower letters only."
  validation {
    condition = lower(var.no_caps) == var.no_caps
    error_message = "value must be in the lower case."
  }
}

#validate the input character limit must be 3 charaters only.
variable "character_limit" {
  type = string
  description = "Here input character limit is 3 charaters only."
  validation {
    condition = length(var.character_limit) == 3
    error_message = "This variable must contain only 3 characters."
  }
}

variable "ip_address" {
  type = string
  description = "Enter the IP address in format x.x.x.x"
  validation {
    condition = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.ip_address))
    error_message = "Must be an IP address of them X.X.X.X"
  }
}

variable "phone_number" {
  type = string
  sensitive = true
  default = "867-5309"
}

locals {
  contact_info = {
    cloud = var.cloud
    department = var.no_caps
    cost_code = var.character_limit
    phone_number = var.phone_number
  }
  my_number = nonsensitive(var.phone_number)
}

output "cloud" {
  value = local.contact_info.cloud
}

output "department" {
  value = local.contact_info.department
}

output "cost_code" {
  value = local.contact_info.cost_code
}

output "phone_number" {
  value = local.contact_info.phone_number
  sensitive = true
}

output "my_number" {
  value = local.my_number
}