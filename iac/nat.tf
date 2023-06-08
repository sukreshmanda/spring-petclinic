resource "aws_nat_gateway" "pet-clinic-nat-gateway-1" {
  subnet_id     = aws_subnet.pet-clinic-public-subnet-1.id
  allocation_id = aws_eip.pet-clinic-nat-eip-1.id
  depends_on    = [
    aws_internet_gateway.pet-clinic-ig
  ]
  tags = {
    Name    = "pet-clinic-nat-gateway-0"
    Creator = "Sukresh"
  }
}
resource "aws_eip" "pet-clinic-nat-eip-1" {
  tags     = {
    domain   = "vpc"
    Name    = "pet-clinic-nat-eip-0"
    Creator = "Sukresh"
  }
}






resource "aws_nat_gateway" "pet-clinic-nat-gateway-2" {
  subnet_id     = aws_subnet.pet-clinic-public-subnet-2.id
  allocation_id = aws_eip.pet-clinic-nat-eip-2.id
  depends_on    = [
    aws_internet_gateway.pet-clinic-ig
  ]
  tags = {
    Name    = "pet-clinic-nat-gateway-1"
    Creator = "Sukresh"
  }
}
resource "aws_eip" "pet-clinic-nat-eip-2" {
  tags     = {
  domain   = "vpc"
  Name    = "pet-clinic-nat-eip-0"
    Creator = "Sukresh"
  }
}
