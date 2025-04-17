output "aws_vpc_id" {
    value = aws_vpc.vpc.id
}

output "igw_id" {
    value = aws_internet_gateway.internet_gateway.id
}

output "public_subnet_1a_id" {
    value = aws_subnet.pub_sub_1a.id
}

output "public_subnet_2b_id" {
    value = aws_subnet.pub_sub_2b.id
}

output "route_table_id" {
    value = aws_route_table.public_rout_table.id
}

output "private_sub_3a_id" {
    value = aws_subnet.pri_sub_3a.id
}

output "private_sub_4b_id" {
    value = aws_subnet.pri_sub_4b.id
}

output "private_sub_5a_id" {
    value = aws_subnet.pri_sub_5a.id
}


output "private_sub_6b_id" {
    value = aws_subnet.pri_sub_6b.id
}