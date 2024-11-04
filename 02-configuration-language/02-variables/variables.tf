variable "aws_region" {
    type = string
    description = "The region to deploy the infra to"
    default = "us-west-2"
}

variable "aws_profile" {
    type = string
    description = "My profile name from aws credentials file"
    default = "bruno_terraform"
}

variable "read_capacity" {
    type = number
    description = "The read capacity for the DynamoDB table"
    default = 5
  
}

variable "write_capacity" {
    type = number
    description = "The write capacity for the DynamoDB table"
    default = 5
}

variable "deletion_protection" {
  type = bool
  description = "value to enable or disable deletion protection"
  default = false
}