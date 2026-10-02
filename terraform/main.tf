terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Security group for AutoDeploy
resource "aws_security_group" "autodeploy_sg" {
  name        = "autodeploy-sg"
  description = "Allow SSH from my IP and HTTP traffic"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["157.51.73.163/32"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "autodeploy-sg"
  }
}
resource "aws_instance" "autodeploy" {
  ami                    = "ami-007b1f3fdea0383d9"
  instance_type          = "t3.micro"
  key_name               = "mumbai-key"
  vpc_security_group_ids = [aws_security_group.autodeploy_sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "autodeploy-server"
  }
}