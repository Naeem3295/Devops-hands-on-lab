#########################################
# Public Route Table
#########################################

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}

resource "aws_route" "public_internet" {

  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = var.internet_gateway_id
}

#########################################
# Private Route Table
#########################################

resource "aws_route_table" "private" {

  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt"
  }
}

resource "aws_route" "private_nat" {

  route_table_id = aws_route_table.private.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = var.nat_gateway_id
}

#########################################
# Associations
#########################################

resource "aws_route_table_association" "public_a" {

  subnet_id = var.public_subnet_a_id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {

  subnet_id = var.public_subnet_b_id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_a" {

  subnet_id = var.private_subnet_a_id

  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {

  subnet_id = var.private_subnet_b_id

  route_table_id = aws_route_table.private.id
}