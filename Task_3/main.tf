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

resource "aws_instance" "n_virginia_server" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "projectkp"
  user_data = file("tomcat_install.sh")
  security_groups = ["default"]
  

  tags = {
  Name = "Tomcat_Server"
  }
  }
  
resource "aws_security_group" "default" {
	tags = {
	type = "terraform-test-security-group"
}
}
