resource "aws_subnet" "pet-clinic-public-subnet" {
  for_each                = var.PUBLIC_SUBNET_MAPPING
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, each.key)
  map_public_ip_on_launch = true
  tags                    = {
    Name    = "pet-clinic-public-subnet-${each.value}"
    Creator = "Sukresh"
  }
}

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
resource "aws_route_table_association" "pet-clinic-public-subnet-association" {
  for_each       = var.PUBLIC_SUBNET_MAPPING
  route_table_id = aws_route_table.pet-clinic-public.id
  subnet_id      = aws_subnet.pet-clinic-public-subnet[each.key].id
}
resource "aws_eip" "pet-clinic-nat-eip" {
  for_each = aws_subnet.pet-clinic-public-subnet
  domain   = "vpc"
  tags     = {
    Name    = "pet-clinic-nat-eip-${each.value.availability_zone}"
    Creator = "Sukresh"
  }
}
resource "aws_nat_gateway" "pet-clinic-nat-gateway" {
  for_each      = aws_subnet.pet-clinic-public-subnet
  subnet_id     = each.value.id
  allocation_id = aws_eip.pet-clinic-nat-eip[each.key].id
  depends_on    = [
    aws_internet_gateway.pet-clinic-ig
  ]
  tags = {
    Name    = "pet-clinic-nat-gateway-${each.value.availability_zone}"
    Creator = "Sukresh"
  }
}
