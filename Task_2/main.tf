terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "jenkins_server" {
  ami             = "ami-0cff7528ff583bf9a"
  instance_type   = "t2.micro"
  key_name        = "projectkp"
  security_groups = ["default"]
  user_data = file("jenkins_install.sh")

  tags = {
    Name = "JenkinsTerra"
  }
}
  resource "aws_security_group" "default" {
	tags = {
	type = "jenkins-test-security-group"
}
}
