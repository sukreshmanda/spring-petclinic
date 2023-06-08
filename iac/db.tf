resource "aws_route_table_association" "pet-clinic-db-subnet-association" {
  for_each       = var.DB_SUBNET_MAPPING
  route_table_id = aws_route_table.pet-clinic-db[each.key].id
  subnet_id      = aws_subnet.pet-clinic-db-subnet[each.key].id
}
resource "aws_route" "pet-clinic-db-route" {
  for_each               = aws_subnet.pet-clinic-db-subnet
  route_table_id         = aws_route_table.pet-clinic-db[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = each.value.id
}
resource "aws_route_table" "pet-clinic-db" {
  for_each = aws_subnet.pet-clinic-db-subnet
  vpc_id   = aws_vpc.pet-clinic-vpc.id
  tags     = {
    Name    = "pet-clinic-db"
    Creator = "Sukresh"
  }
}
