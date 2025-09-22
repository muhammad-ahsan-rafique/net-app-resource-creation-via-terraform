resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr_block
  availability_zone       = var.public_subnet1_az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.env}-subnet-public1-${var.public_subnet1_az}"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2_cidr_block
  availability_zone       = var.public_subnet2_az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${var.env}-subnet-public2-${var.public_subnet2_az}"
  }
}

resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet1_cidr_block
  availability_zone       = var.private_subnet1_az
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.env}-subnet-private1-${var.private_subnet1_az}"
  }
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet2_cidr_block
  availability_zone       = var.private_subnet2_az
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-${var.env}-subnet-private2-${var.private_subnet2_az}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-${var.env}-igw"
  }
}

# all about public  route table and association
# ==============================================================
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-${var.env}-public-rt"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-${var.env}-rtb-private1-${var.private_subnet1_az}"
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-${var.env}-rtb-private2-${var.private_subnet2_az}"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private2.id
}

# Network ACL for public subnet
resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.public1.id, aws_subnet.public2.id]

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 32766
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 32766
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.project_name}-${var.env}-public-nacl"
  }
}


# Elastic Ip Resource

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : 2) : 0
  vpc   = aws_vpc.main.id
  tags  = merge(
    var.nat_eip_tags,
    {
      Name = "${var.project_name}-${var.env}-nat-eip-${count.index + 1}"
    }
  )
}


resource "aws_nat_gateway" "main" {
  count = var.enable_nat_gateway ? (var.single_nat_gateway ? 1 : 2) : 0

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.single_nat_gateway ? aws_subnet.public1.id : element([aws_subnet.public1.id, aws_subnet.public2.id], count.index)
  tags = {
    Name = "${var.project_name}-${var.env}-nat-gateway-${count.index + 1}"
  }
}