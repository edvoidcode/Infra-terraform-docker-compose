# criar primeiro vpc
resource "aws_vpc" "lab-vpc" {
  cidr_block = var.cidr-block

  tags = {
    Name = "lab-vpc"
  }
}

# criar primeira subnet (publica)
resource "aws_subnet" "lab-subnet_1" {
  vpc_id                  = aws_vpc.lab-vpc.id
  cidr_block              = var.subnet1-cidr
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab-subnet_1"
  }
}

# criar internet gateway para subnet
resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "lab-igw"
  }
}
