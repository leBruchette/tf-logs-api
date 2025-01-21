provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
  project_id    = var.HCP_PROJECT_ID
}

data "hcp_vault_secrets_app" "infra" {
  app_name = "infra"
}

locals {
  ghcr_token  = data.hcp_vault_secrets_app.infra.secrets.ghcr_token
}

module "logs-api-golang" {
  source = "./modules/logs-api"
  image_name = "ghcr.io/lebruchette/logs-api-go"
  image_version = "latest"
  port = 81
  docker_username = "lebruchette"
  docker_password = local.ghcr_token
  key_name = aws_key_pair.logs_api_key_pair.key_name
  security_group_id = aws_security_group.logs_api_go_sg.id
}

