region = "us-east-1"
vpc_details = {
  vpc_cidr_range   = "192.168.0.0/16"
  vpc_subnet_azs   = ["a", "b", "c", "d"]
  vpc_subnet_names = ["sub1", "sub2", "app1", "app2"]
  aws_subnet_cidr  = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  
}

