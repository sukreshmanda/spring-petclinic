resource "aws_subnet" "pet-clinic-private-subnet" {
  for_each                = { "1" : "ap-south-1a", "4" : "ap-south-1b" }
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, each.key)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-private-subnet"
    Creator = "Sukresh"
  }
}
resource "aws_subnet" "pet-clinic-db-subnet" {
  for_each                = { "2" : "ap-south-1a", "5" : "ap-south-1b" }
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, each.key)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-db-subnet"
    Creator = "Sukresh"
  }
}

resource "aws_eip" "pet-clinic-nat-eip" {
  domain = "vpc"
  tags   = {
    Name    = "pet-clinic-nat-eip"
    Creator = "Sukresh"
  }
}

resource "aws_nat_gateway" "pet-clinic-nat-gateway" {
  subnet_id     = aws_subnet.pet-clinic-public-subnet.id
  allocation_id = aws_eip.pet-clinic-nat-eip.id
  depends_on    = [
    aws_internet_gateway.pet-clinic-ig
  ]
  tags = {
    Name    = "pet-clinic-nat-gateway"
    Creator = "Sukresh"
  }
}

resource "aws_route_table" "pet-clinic-private" {
  vpc_id = aws_vpc.pet-clinic-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pet-clinic-nat-gateway.id
  }
  tags = {
    Name    = "pet-clinic-private"
    Creator = "Sukresh"
  }
}

resource "aws_route_table_association" "pet-clinic-private-subnet-association" {
  for_each       = toset(["1", "4"])
  route_table_id = aws_route_table.pet-clinic-private.id
  subnet_id      = aws_subnet.pet-clinic-private-subnet[each.key].id
}

resource "aws_route_table_association" "pet-clinic-db-subnet-association" {
  for_each       = toset(["2", "5"])
  route_table_id = aws_route_table.pet-clinic-private.id
  subnet_id      = aws_subnet.pet-clinic-db-subnet[each.key].id
}
