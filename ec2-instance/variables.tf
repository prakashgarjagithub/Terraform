variable "region" {
  description = "creating in region"
  type        = string
  default     = "us-east-1"
}
variable "subnet_cidr" {
  type    = string
  default = "192.168.0.0/24"
}
variable "vpc_cidr_details" {
  type = object({
    vpc_cidr_range   = string
    vpc_subnet_azs   = string
    vpc_subnet_names = string
  })
  default = {
    vpc_cidr_range   = "192.168.0.0/16"
    vpc_subnet_azs   = "a"
    vpc_subnet_names = "web1"
  }
}