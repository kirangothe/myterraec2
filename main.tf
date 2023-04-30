provider "aws" {
    region = "ap-southeast-2"  
}

resource "aws_instance" "foo" {
  ami           = "ami-05f998315cca9bfe3" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
