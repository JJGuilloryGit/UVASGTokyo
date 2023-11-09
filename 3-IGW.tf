resource "aws_internet_gateway" "App1_IGW" {
  vpc_id = aws_vpc.app1.id

  tags = {
    Name = "app1"
    Service = "application1"
    Owner = "Chewbacca"
    Planet = "Mustafar"
    Location = "Tokyo"
    Idea = "Pefection"

  }
}