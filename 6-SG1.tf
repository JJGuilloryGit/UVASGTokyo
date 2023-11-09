resource "aws_security_group" "App1_SG1_Server" {
  name        = "App1-SG1-Server"
  description = "App1-SG1-Server"
  vpc_id      = aws_vpc.app1.id

  ingress {
    description      = "MyHomePage"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG1-Server"
  }
}

resource "aws_security_group" "App1_SG2_LB1" {
  name        = "App1-SG2-LB01"
  description = "App1-SG2-LB01"
  vpc_id      = aws_vpc.app1.id

  ingress {
    description      = "MyHomePage"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG1-LB1"
  }
}