# EC2 INSTANCE 

data "aws_ami" "amazon-linux-2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}


resource "aws_instance" "DB_Private_EC2" {
    
    ami = data.aws_ami.amazon-linux-2.id
    instance_type = "t2.micro"
    associate_public_ip_address = true
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids

    # iam_instance_profile =
    # security_groups =
    
    # availability_zone =
  
  tags = {
    Name = "Private_EC2 BD INSTANCE"
  }
}