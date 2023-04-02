resource "aws_vpc" "terraform" {
  cidr_block = var.vpc_details.vpc_cidr_range
  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.vpc_details.vpc_subnet_names)
  cidr_block        = cidrsubnet(var.vpc_details.vpc_cidr_range, 8, count.index)
  availability_zone = "${var.region}${var.vpc_details.vpc_subnet_azs [count.index]}"
  vpc_id            = aws_vpc.terraform.id
  depends_on = [
    aws_vpc.terraform
  ]
  tags = {
    Name = var.vpc_details.vpc_subnet_names[count.index]
  }
}
resource "aws_internet_gateway" "mygate" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "mygate"
  }

}

resource "aws_route_table" "mytable" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygate.id
  }
}

resource "aws_route_table_association" "table_assoc" {
  
  
}

