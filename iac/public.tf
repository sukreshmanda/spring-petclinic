resource "aws_subnet" "pet-clinic-public-subnet-1" {
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = var.availability_zones[0]
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, 0)
  map_public_ip_on_launch = true
  tags                    = {
    Name    = "pet-clinic-public-subnet-0"
    Creator = "Sukresh"
  }
}
resource "aws_subnet" "pet-clinic-public-subnet-2" {
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = var.availability_zones[1]
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, 1)
  map_public_ip_on_launch = true
  tags                    = {
    Name    = "pet-clinic-public-subnet-1"
    Creator = "Sukresh"
  }
}
resource "aws_route_table_association" "pet-clinic-public-subnet-association-1" {
  route_table_id = aws_route_table.pet-clinic-public.id
  subnet_id      = aws_subnet.pet-clinic-public-subnet-1.id
}
resource "aws_route_table_association" "pet-clinic-public-subnet-association-2" {
  route_table_id = aws_route_table.pet-clinic-public.id
  subnet_id      = aws_subnet.pet-clinic-public-subnet-2.id
}
