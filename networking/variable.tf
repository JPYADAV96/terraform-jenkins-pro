# Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "cidr_public_subnet" {
  description = "List of CIDR blocks for public subnets"
}

variable "cidr_private_subnet" {
  description = "List of CIDR blocks for private subnets"
}

variable "eu_availability_zone" {
  description = "List of availability zones"
}

variable "internet_cidr_block" {
  description = "CIDR block for internet access, typically 0.0.0.0/0"
  default     = "0.0.0.0/0"
}

variable "igw_name" {
  description = "Name for the Internet Gateway"
  default     = "dev-proj-1-igw"
}

variable "public_route_table_name" {
  description = "Name for the Public Route Table"
  default     = "dev-proj-1-public-rt"
}

variable "private_route_table_name" {
  description = "Name for the Private Route Table"
  default     = "dev-proj-1-private-rt"
}

variable "public_subnet_name_prefix" {
  description = "Prefix for Public Subnet names"
  default     = "dev-proj-public-subnet"
}

variable "private_subnet_name_prefix" {
  description = "Prefix for Private Subnet names"
  default     = "dev-proj-private-subnet"
}
