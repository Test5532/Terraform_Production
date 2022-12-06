######################################################################################################5

######################################################################################################5

#VPC OUTPUT
output aws_vpc_id {
value = aws_vpc.Production_VPC
}

######################################################################################################5

######################################################################################################5

#PUBLIC SUBNET 1 OUTPUT
output PUBLIC_SUBNET_ID_1 {
value = aws_subnet.public_subnet1
}

#PUBLIC SUBNET 2 OUTPUT
output PUBLIC_SUBNET_ID_2 {
value = aws_subnet.public_subnet2
}

######################################################################################################5

######################################################################################################5

#PRIVATE SUBNET 1 OUTPUT
output PRIVATE_SUBNET_ID_1 {
value = aws_subnet.private_subnet1
}

#PRIVATE SUBNET 2 OUTPUT
output PRIVATE_SUBNET_ID_2 {
value = aws_subnet.private_subnet2
}

######################################################################################################5

######################################################################################################5