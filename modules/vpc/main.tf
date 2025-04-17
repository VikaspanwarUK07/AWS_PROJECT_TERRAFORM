resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        name = "${var.project_name}-vpc"
    } 
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        name = "${var.project_name}-igw"
    }
}

data "aws_availability_zones" "available_zone" {
  
}
resource "aws_subnet" "pub_sub_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub_sub_1a_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[0]
    map_public_ip_on_launch = true
    tags = {
        name = "pub_sub_1a"
    }
}

resource "aws_subnet" "pub_sub_2b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub_sub_2b_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[1]
    map_public_ip_on_launch = true
    tags = {
        name = "pub_sub_2b"
    }
}


resource "aws_route_table" "public_rout_table" {
    vpc_id = aws_vpc.vpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
  tags = {
    name = "pubic-rt"
  }
}

# associate public subnet pub-sub-1a to public route table

resource "aws_route_table_association" "pub_sub_1a_route_table_association" {
    subnet_id = aws_subnet.pub_sub_1a.id
    route_table_id = aws_route_table.public_rout_table.id
}

resource "aws_route_table_association" "pub_sub_2b_route_table_association" {
    subnet_id = aws_subnet.pub_sub_2b.id
    route_table_id = aws_route_table.public_rout_table.id  
}

#Private subnet 

resource "aws_subnet" "pri_sub_3a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub_3a_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[0]
    map_public_ip_on_launch = false
    tags = {
        name = "pri_sub_3a"
    }
}

resource "aws_subnet" "pri_sub_4b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub_4b_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[1]
    map_public_ip_on_launch = false
    tags = {
        name = "pri_sub_4a"
    }
}

resource "aws_subnet" "pri_sub_5a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub_5a_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[0]
    map_public_ip_on_launch = false
    tags = {
        name = "pri_sub_5a"
    }
}

resource "aws_subnet" "pri_sub_6b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pri_sub_6b_cidr
    availability_zone = data.aws_availability_zones.available_zone.names[1]
    map_public_ip_on_launch = false
    tags = {
        name = "pri_sub_6b"
    }
}
