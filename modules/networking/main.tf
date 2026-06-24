resource "aws_vpc" "my_vpc" {

  cidr_block = var.vpc_cidr

  tags = {

    Name = "terraform-vpc"

  }

}

resource "aws_subnet" "my_subnet" {

  vpc_id                  = aws_vpc.my_vpc.id

  cidr_block              = var.subnet_cidr

  map_public_ip_on_launch = true

  tags = {

    Name = "terraform-subnet"

  }

}

resource "aws_internet_gateway" "my_igw" {

  vpc_id = aws_vpc.my_vpc.id

  tags = {

    Name = "terraform-igw"

  }

}

resource "aws_route_table" "my_rt" {

  vpc_id = aws_vpc.my_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.my_igw.id

  }

  tags = {

    Name = "terraform-rt"

  }

}

resource "aws_route_table_association" "my_rta" {

  subnet_id      = aws_subnet.my_subnet.id

  route_table_id = aws_route_table.my_rt.id

}