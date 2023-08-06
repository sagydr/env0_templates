provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-053b0d53c279acc90"
#  instance_type = "t3.nano"
  instance_type = var.instance_type

  tags = {
    Name = "Sagyyyyyyy-fork"
  }
}
