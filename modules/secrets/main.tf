resource "aws_ssm_parameter" "secret" {
  name        = var.secret_path
  description = "some placeholder secret"
  type        = "SecureString"
  value       = var.plaintext

  tags = {
    env = var.env
  }
}
