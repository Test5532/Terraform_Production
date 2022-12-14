
######################################################################################5

######################################################################################5

resource "aws_lb_listener" "Application_LoadBalancer_listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
  
######################################################################################5

######################################################################################5