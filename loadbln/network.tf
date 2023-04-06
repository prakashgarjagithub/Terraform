resource "aws_vpc" "lb_vpc " {
    cidr_block = var.lb_vpc_info.aws_vpc_range
    tags = {
        Name = lb_vpc
    }
}
resource "aws_subnet" "lpsubnets" {
    count = length(var.lb_vpc_info.aws_subnet_names)
    cidr_block = cidrsubnet(var.lb_vpc_info.aws_vpc_range,8,[count.index])
    availability_zone = var.lb_vpc_info.availability_zone [count.index]
    vpc_id = lb_vpc_info.id
    tags {
        Name = var.lb_vpc_info.aws_subnet_names
    }
}
#resource "aws_internet_gateway" "aig" {
    
  


