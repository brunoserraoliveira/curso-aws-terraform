variable "aws_region" {
  type        = string
  description = "The region to deploy the infra to"
  # default     = "us-west-2"

  validation {
    condition = can(regex("us-east-2", var.aws_region))
    error_message = "Only us-west-2 is allowed"
  }
}

variable "aws_profile" {
  type        = string
  description = "My profile name from aws credentials file"
  default     = "bruno_terraform"
}

# variable "read_capacity" {
#     type = number
#     description = "The read capacity for the DynamoDB table"
#     default = 5

# }

# variable "write_capacity" {
#     type = number
#     description = "The write capacity for the DynamoDB table"
#     default = 5
# }

# variable "deletion_protection" {
#   type = bool
#   description = "value to enable or disable deletion protection"
#   default = false
# }

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default = {
    project   = "Curso AWS com Terraform"
    CreatedAt = "2024-11-04"
  }
}

variable "dynamodb_field_list" {
  type        = list(string)
  description = "List of fields to add to the DynamoDB table"
  default     = ["UserId", "GameTitle"]
}

variable "database_config" {
  type = object({
    table_name          = string
    read_capacity       = optional(number, 3)
    write_capacity      = optional(number, 3)
    deletion_protection = optional(bool, false)
    hash_key = object({
      name = string
      type = string
    })

    range_key = object({
      name = string
      type = string
    })
  })

  description = "The configuration for the DynamoDB table"
  default = {
    table_name = "GameScores"
    hash_key = {
      name = "UserId"
      type = "S"
    }

    range_key = {
      name = "GameTitle"
      type = "S"
    }
  }
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
  sensitive = true
}

variable "environment" {
  type = string
  description = ""
  }