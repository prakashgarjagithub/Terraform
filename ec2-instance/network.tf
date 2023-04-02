resource "aws_vpc" "aws_vpc_cidr" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "vpcmy"
  }
}
resource "aws_subnet" "subnets" {
  cidr_block        = var.vpc_cidr_details.vpc_cidr_range
  availability_zone = "${var.region}${var.vpc_cidr_details.vpc_subnet_azs}"
  vpc_id            = aws_vpc.aws_vpc_cidr.id
  tags = {
    Name = "web1"
  }
  depends_on = [
    aws_vpc.aws_vpc_cidr
  ]

}
resource "aws_internet_gateway" "mygate" {
  vpc_id = aws_vpc.aws_vpc_cidr.id
  tags = {
    Name = "mygate"
  }
  depends_on = [
    aws_vpc.aws_vpc_cidr
  ]
}
resource "aws_route_table" "mytable" {
  vpc_id = aws_vpc.aws_vpc_cidr.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygate.id
  }
  tags = {
    Name = "rtb"
  }
  depends_on = [
    aws_internet_gateway.mygate,
    aws_subnet.subnets
  ]
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = [var.vpc_cidr_details.vpc_subnet_names]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}
resource "aws_route_table_association" "aws_rta" {
  subnet_id      = aws_subnet.subnets.id
  route_table_id = aws_route_table.mytable.id

}























