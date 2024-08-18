resource "aws_instance" "web" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t2.micro"
  security-groups=[aws_security_grouproboshop-all.id]

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" {
  name        = "roboshop-all-aws"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id
  
  ingress {
    description      = "Allow all ports"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["aws_vpc.main.ipv6_cidr_block"]
  
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}


