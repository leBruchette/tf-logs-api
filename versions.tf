terraform {
  required_version = ">= 1.9.0"

    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "5.82.2"
      }
      hcp = {
        source  = "hashicorp/hcp"
        version = "0.101.0"
      }
    }
}