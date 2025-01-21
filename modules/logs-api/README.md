<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.logs_api_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docker_password"></a> [docker\_password](#input\_docker\_password) | Docker password | `string` | n/a | yes |
| <a name="input_docker_username"></a> [docker\_username](#input\_docker\_username) | Docker username | `string` | n/a | yes |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Image repository and name, such as myrepo/myimage | `string` | n/a | yes |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Version of the image to deploy | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the key pair to use for the instance | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port to run the container on | `number` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | ID of the security group to attach to the instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the instance |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | The public DNS name of the instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the instance |
<!-- END_TF_DOCS -->