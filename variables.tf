variable "project" {
  type        = string
  nullable    = false
  description = "The name of the project that hosts the environment"
}

variable "service" {
  type        = string
  nullable    = false
  description = "The name of the service that will be run on the environment"
}

variable "private_subnets_id" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "db_username" {
  default = ""
}

variable "db_password" {
  default = ""
}