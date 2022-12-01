provider "aws" {
  region  = "us-east-1"
}


resource "aws_instance" "ec2_instance" {
  # us-west-1
  ami           = "ami-0149b2da6ceec4bb0"
  instance_type = "t2.micro"
}
