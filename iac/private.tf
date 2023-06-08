resource "aws_subnet" "pet-clinic-private-subnet-1" {
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = var.availability_zones[0]
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, 2)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-private-subnet-0"
    Creator = "Sukresh"
  }
}
resource "aws_subnet" "pet-clinic-private-subnet-2" {
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = var.availability_zones[1]
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, 3)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-private-subnet-1"
    Creator = "Sukresh"
  }
}
resource "aws_route_table_association" "pet-clinic-private-subnet-association-1" {
  route_table_id = aws_route_table.pet-clinic-private-1.id
  subnet_id      = aws_subnet.pet-clinic-private-subnet-1.id
}
resource "aws_route_table_association" "pet-clinic-private-subnet-association-2" {
  route_table_id = aws_route_table.pet-clinic-private-2.id
  subnet_id      = aws_subnet.pet-clinic-private-subnet-2.id
}
