variable "env" {
  description = "the name of the env the secret belongs to"
  type        = string
}

variable "plaintext" {
  description = "placeholder for a secret"
  type        = string
}

variable "secret_path" {
  description = "the path the secret is stored at"
  type        = string
}
