data "aws_vpc" "default" {
    default = true
}
data "aws_subnet" "primary" {
    default = true
    availability_zone = 
    vpc_id = data.aws_vpc.primary.id
  
}
data "aws_internet_gateway" "default" {
    default = true
    vpc_id = data.aws_vpc.primary.id  
}
data "aws_route_table" "default" {
    subnet_id = data.aws_subnet.primary.id
}