
######################################################################################5

######################################################################################5

#NAT GATEWAY CREATION

resource "aws_nat_gateway" "NAT_AZ1" {
  
  allocation_id = aws_eip.Nat_Elastic_ip.id
  subnet_id     = var.subnet_id

  tags = {
    Name = "NAT-Gateway"
  }

}


# EIP FOR NAT GATEWAY CREATION

resource "aws_eip" "Nat_Elastic_ip" {
  vpc = true
  }


  
######################################################################################5

######################################################################################5