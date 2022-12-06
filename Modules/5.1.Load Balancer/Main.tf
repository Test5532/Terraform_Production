#####################################################################################5

######################################################################################5

# Application Load Balancer Creation

resource "aws_lb" "Application_LoadBalancer_Access" {
  name               = "Rockstar-App"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.vpc_security_group_ids
  subnets            = [var.public_subnet_id_1,var.public_subnet_id_2]

  
  /*access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }*/

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}


######################################################################################5

######################################################################################5

