data "aws_security_group" "prakash" {
    name = "prakash"
}
data "aws_key_pair" "public" {
    key_name =  "public"
    include_public_key = true
  
}
resource "aws_instance" "ansible" {
    ami = "ami-007855ac798b5175e"
    subnet_id = data.aws_subnet.primary.id
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = 
    user_data = file("shell.sh")
    tags = {
        Name = "ansible"
    }
  
}