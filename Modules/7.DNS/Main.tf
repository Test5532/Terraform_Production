
######################################################################################5

######################################################################################5

resource "aws_route53_zone" "Sharelearnlive" {
  name = "sharelearn.live"

  tags = {
    Environment = "PROD_DNS"
  }
}


######################################################################################5

######################################################################################5

resource "aws_route53_record" "Record_Route53_A" {
  zone_id = aws_route53_zone.Sharelearnlive.zone_id
  name    = "sharelearn.live"
  type    = "A"
  
  #Below all details are for ALB only.

  alias{
    name = var.name
    zone_id = var.zone_id
    evaluate_target_health = true
  }
}