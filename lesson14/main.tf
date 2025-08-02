# main.tf
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet"]
  }
}

data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet"]
  }
}

data "aws_security_group" "public" {
  filter {
    name   = "tag:Name"
    values = ["public-sg"]
  }
}

data "aws_security_group" "private" {
  filter {
    name   = "tag:Name"
    values = ["private-sg"]
  }
}

resource "aws_instance" "public" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 18.04 LTS
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.public.id]
  key_name      = "my-key"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
			  systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 18.04 LTS
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.private.id
  vpc_security_group_ids = [data.aws_security_group.private.id]
  key_name      = "my-key"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
			  sed -i 's/listen 80/listen 8080/' /etc/nginx/sites-enabled/default
              systemctl restart nginx              
              EOF

  tags = {
    Name = "private-instance"
  }
}