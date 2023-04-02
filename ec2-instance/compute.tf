resource "aws_security_group" "aws_sg" {
  name        = "ags"
  description = "tcp"
  vpc_id      = aws_vpc.aws_vpc_cidr.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.aws_vpc_cidr.cidr_block]
  }
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.aws_vpc_cidr.cidr_block]
  }
  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_key_pair" "keypair" {
  key_name   = "keypairmy"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV8HhRYZLOwJGiWfCtPpfX01t2ZoYSDPg8rWNLhbBIGnThmI+HD3mPmN6rFAaKKmMB87OCRwc5+6oX8Kg9y8Cjno77/5gQkT9EYBgCuNmnTBg3tjGfZc83gnTMaMk2kEhbqnu0oxWQsFSHzrl0fyw9j0bFaefDflMg9nkj5poCbqPiAYyo1VpKHGXXc9MmFn4ycgSudAxKjK+xK7soqOS9PALm283C1A4zvTcShrGo6yN/Y9FstNJAIcss+k7VS2Fn3bAiqMiD7dwCsTSniaHaV2OxQV+nbivbQjTgZK+thvzC9qPg/USJn3D4PujKg7adtC+EZ5CSdCMZrYjwL8qGU848+pyH6rsHug4QH3adS+269TY4v20N+OMyX18p4ffQFz7sN9Vn0s7v8U4VusicMPSxtq9JbC6TsqhNIVWP0KxPfuH7Fgy+vLwm5EiYrFZRj+/+WXAvcGlwd9NJEX6eiCDjH9MI7v/CZKnucxrIZ5w/hNbHPgBu4SZud022XQc= praka@PRAKASH"
}
resource "aws_instance" "myterra" {
  ami                         = "ami-006e00d6ac75d2ebb"
  subnet_id                   = data.aws_subnets.subnets.ids[0]
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.aws_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.keypair.id
  tags = {
    Name = "myterra"
  }
  depends_on = [
    aws_security_group.aws_sg
  ]

}