resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "marcelo-msk-poc"
  }
}

resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"


  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "public-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"


  tags = {
    Name = "public-3"
  }
}

resource "aws_internet_gateway" "main-igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "rt-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-igw.id
    }

    tags = {
        Name = "main-public-1"
    }
}

resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = aws_subnet.public-1.id
    route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "main-public-1-b" {
    subnet_id = aws_subnet.public-2.id
    route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "main-public-1-c" {
    subnet_id = aws_subnet.public-3.id
    route_table_id = aws_route_table.rt-public.id
}