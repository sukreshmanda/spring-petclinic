resource "aws_subnet" "pet-clinic-public-subnet" {
  vpc_id                  = aws_vpc.pet-clinic-vpc.id
  availability_zone       = "ap-south-1a"
  cidr_block              = cidrsubnet(aws_vpc.pet-clinic-vpc.cidr_block, var.SUBNET_SIZE, 0)
  map_public_ip_on_launch = true
  tags                    = {
    Name    = "pet-clinic-public-subnet"
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
  route_table_id = aws_route_table.pet-clinic-public.id
  subnet_id      = aws_subnet.pet-clinic-public-subnet.id
}
