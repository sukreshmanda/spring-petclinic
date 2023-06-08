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
