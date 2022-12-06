
# PRIVATE SSH ACCESS FROM BASTION HOST to PRIVATE INSTANCES

resource "aws_security_group" "Allow_LOAD_BALANCER_ACCESS" {
  name        = "Allow_LOAD_BALANCER_ACCESS"
  description = "Allow_LOAD_BALANCER_ACCESS"
  vpc_id      = var.vpc_id

  ingress {
    description      = "INGRESS TO PRIVATE INSTANCES"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.202.128.0/19","10.202.160.0/19"]
  }

  egress {
    description      = "EGRESS TO PRIVATE INSTANCES"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.202.128.0/19","10.202.160.0/19"]
  }

  tags = {
    Name = "Allow_LOAD_BALANCER_ACCESS"
  }

}