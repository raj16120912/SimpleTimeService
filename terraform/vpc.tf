# Creating VPC
resource "aws_vpc" "simplevpc" {
  cidr_block           = "10.0.0.0/16"
  tags = {
    Name = "simpletimeservice-vpc"
  }
}

#Creating Subnets 2 public , 2 private
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.simplevpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.simplevpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.simplevpc.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.simplevpc.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.simplevpc.id
  tags = {
    Name = "simplevpc-igw"
  }
}