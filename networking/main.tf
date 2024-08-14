
# Outputs
output "dev_proj_1_vpc_id" {
  value = aws_vpc.dev_proj_1_vpc.id
}

output "dev_proj_1_public_subnets" {
  value = aws_subnet.public_subnets.*.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public_subnets.*.cidr_block
}

# Setup VPC
resource "aws_vpc" "dev_proj_1_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Setup Public Subnet
resource "aws_subnet" "public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.dev_proj_1_vpc.id
  cidr_block        = var.cidr_public_subnet[count.index]
  availability_zone = var.eu_availability_zone[count.index]
  tags = {
    Name = "${var.public_subnet_name_prefix}-${count.index + 1}"
  }
}

# Setup Private Subnet
resource "aws_subnet" "private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.dev_proj_1_vpc.id
  cidr_block        = var.cidr_private_subnet[count.index]
  availability_zone = var.eu_availability_zone[count.index]
  tags = {
    Name = "${var.private_subnet_name_prefix}-${count.index + 1}"
  }
}

# Setup Internet Gateway
resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  tags = {
    Name = var.igw_name
  }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  route {
    cidr_block = var.internet_cidr_block
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}

# Public Route Table and Subnet Association
resource "aws_route_table_association" "public_rt_subnet_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  tags = {
    Name = var.private_route_table_name
  }
}

# Private Route Table and Subnet Association
resource "aws_route_table_association" "private_rt_subnet_association" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
