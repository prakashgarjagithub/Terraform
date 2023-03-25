resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }
}

resource "aws_subnet" "ntier" {
    vpc_id = aws_vpc.ntier.id
    cidr_block = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24","192.168.6.0/24"] 
    tags = {
      Name = "ntier"
    }
}

