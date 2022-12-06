######################################################################################

######################################################################################

# PUBLIC SSH ACCESS FOR BASTION HOST

resource "aws_security_group" "Allow_SSH_Bastion" {
  name        = "Allow_SSH_Bastion"
  description = "Allow_SSH_Bastion inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  tags = {
    Name = "Allow_SSH_Bastion"
  }

}