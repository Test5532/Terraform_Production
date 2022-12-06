#####################################################################################5

######################################################################################5

# Application Load Balancer Target Group Creation


resource "aws_lb_target_group" "Loadbalancer_Target_Group" {
 
  name        = "ProductionTG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check{
   enabled  = true 
   healthy_threshold  =   2
   interval   =   10
   port   =   80 
   unhealthy_threshold  =   2
  }

}


######################################################################################5

######################################################################################5

