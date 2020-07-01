variable "env" {
  description = "the name of the env the secret belongs to"
  type        = string
}

variable "aws_region" {
  description = "the aws region to provision resources within"
  type        = string
}

variable "secret_path" {
  description = "the path to write the secret to"
  type        = string
}

variable "secret_plaintext" {
  description = "the secret plaintext"
  type        = string
}