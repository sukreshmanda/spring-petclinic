resource "aws_route_table" "pet-clinic-private-1" {
  vpc_id = aws_vpc.pet-clinic-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pet-clinic-nat-gateway-1.id
  }
  tags = {
    Name    = "pet-clinic-private-0"
    Creator = "Sukresh"
  }
}

resource "aws_route_table" "pet-clinic-private-2" {
  vpc_id = aws_vpc.pet-clinic-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pet-clinic-nat-gateway-2.id
  }
  tags = {
    Name    = "pet-clinic-private-1"
    Creator = "Sukresh"
  }
}
