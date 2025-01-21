# tf-logs-api

This project sets up infrastructure for a Golang-based Logs API using Terraform. 
It includes configuration for AWS resources, HCP Vault integration, and Docker image deployment.  
This project assumes working knowledge of initializing and provisioning resources using terraform. Please refer to [Terraform tutorials](https://developer.hashicorp.com/terraform/tutorials/aws-get-started) for filling any knowledge gaps.
## Prerequisites

- Terraform >= 1.9.0
- AWS account
- HCP account
- Docker

## Project Structure

- `main.tf`: Main configuration file for the project.
- `versions.tf`: Specifies the required Terraform version and providers.
- `variables.tf`: Defines the variables used in the project.
- `common.tf`: Contains common resources like key pairs and security groups.

## Setup

1. **Clone the repository:**

    ```sh
    git clone https://github.com/lebruchette/tf-logs-api.git && cd tf-logs-api
    ```

2. **Configure AWS credentials:**

   Ensure your AWS credentials are configured. You can use the AWS CLI to configure them:

    ```sh
    aws configure
    ```

3. **Set HCP variables:**

   Update the `variables.tf` file with your HCP credentials. These values can also be set using run-specific environment variables as noted in [terraform documentation](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables#run-specific-variables):

    ```hcl
    variable "HCP_CLIENT_ID" {
      type        = string
      description = "The client ID for the HCP provider"
      default     = "your-hcp-client-id"
    }

    variable "HCP_CLIENT_SECRET" {
      type        = string
      description = "The client secret for the HCP provider"
      default     = "your-hcp-client-secret"
    }

    variable "HCP_PROJECT_ID" {
      type        = string
      description = "The project ID for the HCP provider"
      default     = "your-hcp-project-id"
    }
    ```

## Resources Created

- **HCP Vault Secrets App**: Retrieves secrets from HCP Vault.
- **TLS Private Key**: Generates an RSA private key.
- **AWS Key Pair**: Creates an AWS key pair using the generated private key.
- **AWS Security Group**: Creates a security group for the Logs API instances.

## Modules

- **logs-api-golang**: Deploys logs-api-go Docker container using the specified image and version.
- **logs-api-node**: Deploys logs-api-node-container Docker container using the specified image and version.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.