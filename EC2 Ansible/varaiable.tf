variable "region" {
    type = string
    default = us-east-1
}
variable "aws_subnet" "default" {
    availability_zone = "${var.region}a"
    vpc_id = aws_subnet.primary.id
}
