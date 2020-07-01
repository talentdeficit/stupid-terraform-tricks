module "secret" {
  source = "../modules/secrets"

  secret_path = var.secret_path

  plaintext = var.secret_plaintext

  env = var.env
}