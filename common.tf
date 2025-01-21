locals {
  keypair_name = "logs-api"
}

resource "tls_private_key" "logs_api_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096

  provisioner "local-exec" {
    when    = create
    command = <<-EOT
      mkdir -p ~/.aws/logs-api
      echo '${tls_private_key.logs_api_private_key.private_key_pem}' > ~/.aws/logs-api/${local.keypair_name}.pem
      chmod 400 ~/.aws/logs-api/${local.keypair_name}.pem
    EOT
  }
}

resource "aws_key_pair" "logs_api_key_pair" {
  key_name   = local.keypair_name
  public_key = tls_private_key.logs_api_private_key.public_key_openssh

  provisioner "local-exec" {
    when    = destroy
    command = <<-EOT
      chmod 777 ~/.aws/logs-api/${self.key_name}.pem
      rm -rf ~/.aws/logs-api
    EOT
  }
}

// security group intended to share between any instance that is serving any version of the logs api
resource "aws_security_group" "logs_api_go_sg" {
  name_prefix = "logs-api-go-"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}