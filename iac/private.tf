resource "aws_subnet" "pet-clinic-private-subnet" {
  for_each                = var.PRIVATE_SUBNET_MAPPING
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, each.key)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-private-subnet-${each.value}"
    Creator = "Sukresh"
  }
}
resource "aws_subnet" "pet-clinic-db-subnet" {
  for_each                = var.DB_SUBNET_MAPPING
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = each.value
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, each.key)
  map_public_ip_on_launch = false
  tags                    = {
    Name    = "pet-clinic-db-subnet-${each.value}"
    Creator = "Sukresh"
  }
}
resource "aws_route_table" "pet-clinic-private" {
  for_each = aws_subnet.pet-clinic-private-subnet
  vpc_id   = aws_vpc.pet-clinic-vpc.id
  tags     = {
    Name    = "pet-clinic-private"
    Creator = "Sukresh"
  }
}
resource "aws_route" "pet-clinic-private-route" {
  for_each               = aws_subnet.pet-clinic-public-subnet
  route_table_id         = aws_route_table.pet-clinic-private[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = each.value.id
}

resource "aws_route_table_association" "pet-clinic-private-subnet-association" {
  for_each       = var.PRIVATE_SUBNET_MAPPING
  route_table_id = aws_route_table.pet-clinic-private[each.key].id
  subnet_id      = aws_subnet.pet-clinic-private-subnet[each.key].id
}
