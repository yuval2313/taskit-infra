output vpc_id {
  value = aws_vpc.vpc.id
}

output subnet_id_1 {
  value = aws_subnet.subnet_1.id
}

output subnet_id_2 {
  value = aws_subnet.subnet_2.id
}
