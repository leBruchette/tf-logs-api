provider "aws" {
  region     = "us-east-2"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "logs_api_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  key_name = var.key_name
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo chkconfig docker on
              sudo docker login ghcr.io -u ${var.docker_username} -p ${var.docker_password}
              sudo docker pull ${var.image_name}:${var.image_version}
              image_name=$(echo ${var.image_name} | awk -F'/' '{print $NF}')
              sudo docker run -d --name $image_name-container -p ${var.port}:8080 -v /var/log:/var/log ${var.image_name}:${var.image_version}
              EOF

  tags = {
    Name = var.image_name
  }
}

