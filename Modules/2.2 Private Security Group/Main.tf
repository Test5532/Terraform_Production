# PRIVATE SSH ACCESS FROM BASTION HOST to PRIVATE INSTANCES

resource "aws_security_group" "Allow_SSH_PRIVATE" {
  name        = "Allow_SSH_PRIVATE"
  description = "Allow_SSH_PRIVATE"
  vpc_id      = var.vpc_id

  ingress {
    description      = "INGRESS TO PRIVATE INSTANCES"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    #cidr_blocks      = ["10.202.128.0/19","10.202.160.0/19"]
    cidr_blocks      = ["0.0.0.0/0"]
 
  }

  egress {
    description      = "EGRESS TO PRIVATE INSTANCES"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    #cidr_blocks     = ["10.202.128.0/19","10.202.160.0/19"]
    cidr_blocks      = ["0.0.0.0/0"]              

  }

  tags = {
    Name = "Allow_SSH_PRIVATE"
  }

}