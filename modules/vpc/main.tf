resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "terraform-public-subnet"
  }
}
resource "aws_internet_gateway" "gw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }

}
resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }

}
resource "aws_route_table_association" "public_assoc" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id

}