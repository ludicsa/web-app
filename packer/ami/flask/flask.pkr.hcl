packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_id" {
  type    = string
  default = "ami-05c13eab67c5d8861"
}

source "amazon-ebs" "aws-flask" {
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ec2-user"
  
  ami_name = "flask-ami-${substr(md5(timestamp()), 0, 8)}"
}

build {

  sources = ["source.amazon-ebs.aws-flask"]

  provisioner "shell" {
    script = "../../scripts/install-flask.sh"
  }
}