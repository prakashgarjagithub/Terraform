variable "region" {
    type = string
    description = "lb region"
    default = "us-east-1"
  
}
variable "lb_vpc_info" {
    type = object({
        aws_vpc_range = string
        aws_subnet = list(string)
        availability_zone = list(string)
        aws_subnet_names = list(string)
    })
    default = {
      availability_zone = [ "a","b" ]
      aws_subnet = [ "192.168.0.0/24","192.168.1.0/24" ]
      aws_vpc_range = "192.168.0.0/16"
      aws_subnet_names = ["web","sub"]
    }  
}

