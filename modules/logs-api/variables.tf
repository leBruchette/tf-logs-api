variable "image_name" {
  description = "Image repository and name, such as myrepo/myimage"
  type        = string
}

variable "image_version" {
    description = "Version of the image to deploy"
    type        = string
}

variable "docker_username" {
  description = "Docker username"
  type        = string
}

variable "docker_password" {
  description = "Docker password"
  type        = string
  sensitive   = true
}

variable "key_name" {
    description = "Name of the key pair to use for the instance"
    type        = string
}

variable "port" {
    description = "Port to run the container on"
    type        = number
}

variable "security_group_id" {
    description = "ID of the security group to attach to the instance"
    type        = string
}