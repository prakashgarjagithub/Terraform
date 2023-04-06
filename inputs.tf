variable "region" {
  type        = string
  default     = "us-east-1"
  description = "creating a region"
}
# this is terraform

variable "ntier_vpc_range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "creating vpc range"
}

variable "ntier-app1-cidr" {
  type    = string
  default = "192.168.0.0/24"

}

variable "ntier-app2-cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "ntier-db1-cidr" {
  type    = string
  default = "192.168.2.0/24"
}

variable "ntier-db2-cidr" {
  type    = string
  default = "192.168.3.0/24"
}



