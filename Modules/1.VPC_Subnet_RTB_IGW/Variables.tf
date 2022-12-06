######################################################################################################5

######################################################################################################5

#VPC VARIABLE

variable vpc_cidr_block {
    default = "10.202.0.0/16"
}

######################################################################################################5

######################################################################################################5

#PUBLIC SUBNET VARIABLE

#PUBLIC SUBNET 1

variable public_cidr_block_1{
    default = "10.202.128.0/19"
}

variable public_subnet1_availability_zone_name{
    default = "ap-south-1a"
}

#PUBLIC SUBNET 2

variable public_cidr_block_2{
    default = "10.202.160.0/19"
}

variable public_subnet2_availability_zone_name{
    default = "ap-south-1b"
}


######################################################################################################5

######################################################################################################5

#PRIVATE SUBNET VARIABLE

#PRIVATE SUBNET 1
variable private_cidr_block_1{
    default = "10.202.192.0/19"
}

variable private_subnet1_availability_zone_name{
    default = "ap-south-1a"
}



#PRIVATE SUBNET 2

variable private_cidr_block_2{
    default = "10.202.224.0/19"
}

variable private_subnet2_availability_zone_name{
    default = "ap-south-1b"
}



#PRIVATE DATABASE SUBNET 1

variable private_db_cidr_block_1{
    default = "10.202.64.0/19"
}

variable private_db_subnet1_availability_zone_name{
    default = "ap-south-1a"

}

#PRIVATE DATABASE SUBNET 2

variable private_db_cidr_block_2{
    default = "10.202.96.0/19"
}

variable private_db_subnet2_availability_zone_name{
    default = "ap-south-1b"
}


######################################################################################################5

######################################################################################################5
/*
#NAT GATEWAY ROUTES

variable nat_gateway_id{}
*/