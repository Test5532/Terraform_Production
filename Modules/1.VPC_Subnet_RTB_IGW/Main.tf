
######################################################################################################5

######################################################################################################5


#VPC RESOURCE
resource "aws_vpc" "Production_VPC"{
    cidr_block = var.vpc_cidr_block
    instance_tenancy="default"
    enable_dns_support="true"
    enable_dns_hostnames="true"

    tags = {
        CUSTOMER ="CUSTOMER"
        Name = "PROD"
    }
}


######################################################################################################5

######################################################################################################5


#PUBLIC SUBNET RESOURCE

#Public 1
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.Production_VPC.id  
  cidr_block = var.public_cidr_block_1
  availability_zone = var.public_subnet1_availability_zone_name
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
  }
}

#Public 2
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.Production_VPC.id
  cidr_block = var.public_cidr_block_2
  availability_zone = var.public_subnet2_availability_zone_name
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
  }
}


#PRIVATE SUBNET RESOURCE

#Private 1
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.Production_VPC.id
  cidr_block = var.private_cidr_block_1
  availability_zone = var.private_subnet1_availability_zone_name
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet1"
  }
}

#Private 2
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.Production_VPC.id
  cidr_block = var.private_cidr_block_2
  availability_zone = var.private_subnet2_availability_zone_name
  map_public_ip_on_launch = false

  tags = {
    Name = "private_subnet2"
  }
}

#Private 3
resource "aws_subnet" "private_db_subnet1" {
  vpc_id     = aws_vpc.Production_VPC.id
  cidr_block = var.private_db_cidr_block_1
  availability_zone = var.private_db_subnet1_availability_zone_name
  map_public_ip_on_launch = false

  tags = {
    Name = "private_db_subnet1"
  }
}

#Private 4
resource "aws_subnet" "private_db_subnet2" {
  vpc_id     = aws_vpc.Production_VPC.id
  cidr_block = var.private_db_cidr_block_2
  availability_zone = var.private_db_subnet2_availability_zone_name
  map_public_ip_on_launch = false

  tags = {
    Name = "private_DB_subnet2"
  }
}

######################################################################################################5

######################################################################################################5


###########################################
#PUBLIC SUBNET ROUTE TABLE AND ASSOCIATION 

resource "aws_route_table" "PUBLIC_SUBNET_ROUTE_TABLE" {
  vpc_id = aws_vpc.Production_VPC.id

  route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.Internet_Gateway.id
    }

  tags = {
    Name = "PUBLIC_SUBNET_ROUTE_TABLE"
  }
}


resource "aws_route_table_association" "PUBLIC_SUBNET1_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.PUBLIC_SUBNET_ROUTE_TABLE.id
}

resource "aws_route_table_association" "PUBLIC_SUBNET2_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.PUBLIC_SUBNET_ROUTE_TABLE.id
}


###########################################

#PRIVATE SUBNET ROUTE TABLE AND ASSOCIATION 

resource "aws_route_table" "PRIVATE_SUBNET_ROUTE_TABLE" {
  vpc_id = aws_vpc.Production_VPC.id

  tags = {
    Name = "PRIVATE_SUBNET_ROUTE_TABLE"
  }
}

resource "aws_route_table_association" "PRIVATE_SUBNET1_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.PRIVATE_SUBNET_ROUTE_TABLE.id
}


resource "aws_route_table_association" "PRIVATE_SUBNET2_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.PRIVATE_SUBNET_ROUTE_TABLE.id
}


###########################################

#DB SUBNET ROUTE TABLE AND ASSOCIATION 


resource "aws_route_table_association" "PRIVATE_DB_SUBNET1_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.private_db_subnet1.id
  route_table_id = aws_route_table.PRIVATE_SUBNET_ROUTE_TABLE.id
}


resource "aws_route_table_association" "PRIVATE_DB_SUBNET2_ROUTE_TABLE_ASSOCIATION" {
  subnet_id      = aws_subnet.private_db_subnet2.id
  route_table_id = aws_route_table.PRIVATE_SUBNET_ROUTE_TABLE.id
}


######################################################################################################5

######################################################################################################5


#INTERNET GATEWAY RESOURCE

resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = aws_vpc.Production_VPC.id

  tags = {
    Name = "MAIN_IGW"
  }
}

#INTERNET GATEWAY ATTACHMENT TO EXISTING VPC
/*
resource "aws_internet_gateway_attachment" "Internet_Gateway_Attachment" {
  internet_gateway_id = aws_internet_gateway.Internet_Gateway.id
  vpc_id              = aws_vpc.Production_VPC.id
}

#INTERNET GATEWAY ROUTE TABLE AND ASSOCIATION 

 resource "aws_route_table" "INTERNET_GATEWAY_ROUTE_TABLE" {
  vpc_id = aws_vpc.Production_VPC.id
   route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.Internet_Gateway.id
    }

  tags = {
    Name = "INTERNET_GATEWAY_SUBNET_ROUTE_TABLE"
  }
}

resource "aws_route_table_association" "INTERNET_GATEWAY_SUBNET_ROUTE_TABLE_ASSOCIATION" {
  gateway_id     = aws_internet_gateway.Internet_Gateway.id
  route_table_id = aws_route_table.INTERNET_GATEWAY_ROUTE_TABLE.id
}
*/

######################################################################################################5

######################################################################################################5




