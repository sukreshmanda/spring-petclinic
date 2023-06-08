resource "aws_internet_gateway" "pet-clinic-ig" {
  vpc_id = aws_vpc.pet-clinic-vpc.id
  tags   = {
    Name    = "pet-clinic-ig"
    Creator = "Sukresh"
  }
}
resource "aws_route_table" "pet-clinic-public" {
  vpc_id = aws_vpc.pet-clinic-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pet-clinic-ig.id
  }
  tags = {
    Name    = "pet-clinic-public"
    Creator = "Sukresh"
  }
}
