data "aws_security_group" "launch-wizard-3" {
  name = "launch-wizard-3"
}
data "aws_key_pair" "jenkins" {
  key_name           = "jenkins"
  include_public_key = true
}
resource "aws_instance" "myansible" {
  ami                         = "ami-06e46074ae430fba6"
  subnet_id                   = data.aws_subnet.first.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "jenkins"
  user_data                   = file("ansible.sh")
  tags = {
    "Name" = "myansible"
  }
}

