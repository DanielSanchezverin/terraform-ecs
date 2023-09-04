data "aws_availability_zones" "available" {}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.environment}-vpc"
  }
}

# Create Public subnet
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnet_cidr))[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-${data.aws_availability_zones.available.names[count.index]}-${count.index}",
  }
}

# Create Private subnet
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = slice(data.aws_availability_zones.available.names, 0, length(var.private_subnet_cidr))[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment}-private-subnet-${data.aws_availability_zones.available.names[count.index]}-${count.index}",
  }
}

# Create Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-internet-gateway"
  }
}

# Create Elastic IP
resource "aws_eip" "main" {
  vpc = true

  tags = {
    Name = "${var.environment}-eip"
  }
}

# Create Nat gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.environment}-nat-gateway"
  }
}

# Create Public Route Table
resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.environment}-route-table-public"
  }
}

# Associate public subnets to the routing table
resource "aws_route_table_association" "public_subnet" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_subnet.id
}

# Create Private Route Table
resource "aws_route_table" "private_subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.environment}-route-table-private"
  }
}

# Associate private subnets to the routing table
resource "aws_route_table_association" "private_subnet" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_subnet.id
}
