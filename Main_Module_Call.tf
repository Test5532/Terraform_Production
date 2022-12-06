######################################################################################5

######################################################################################5


#Call VPC From Main Module

module "Production_VPC"{
source = "./Modules/1.VPC_Subnet_RTB_IGW"
}

######################################################################################5

######################################################################################5

# Call Security Group Module Creation

module "Bastion_PUBLIC_EC2_Security_Group"{
source = "./Modules/2.1 Bastion Security Group"
vpc_id = module.Production_VPC.aws_vpc_id.id
}

module "PRIVATE_EC2_APP_Security_Group"{
source = "./Modules/2.2 Private Security Group"
vpc_id = module.Production_VPC.aws_vpc_id.id
}

module "LB_Security_Group"{
source = "./Modules/2.3 LB Security Group"
vpc_id = module.Production_VPC.aws_vpc_id.id
}


######################################################################################5

######################################################################################5
/*
#Load Balancer Creation and Configuration

module "Application_LoadBalancer"{
source = "./Modules/5.1.Load Balancer"
depends_on = [module.Production_VPC]
vpc_id = module.Production_VPC.aws_vpc_id.id
public_subnet_id_1 = module.Production_VPC.PUBLIC_SUBNET_ID_1.id
public_subnet_id_2 = module.Production_VPC.PUBLIC_SUBNET_ID_2.id
vpc_security_group_ids = [module.Bastion_PUBLIC_EC2_Security_Group.aws_security_group_public.id]
}

module "Application_LoadBalancer_Target_Group"{
source = "./Modules/5.2. Load Balancer Target Group"
depends_on = [module.Production_VPC]
vpc_id = module.Production_VPC.aws_vpc_id.id
}

module "Application_LoadBalancer_Target_Group_Attachment"{
source = "./Modules/5.3 Target Group Attachment"
depends_on = [module.Production_VPC]
target_group_arn = module.Application_LoadBalancer_Target_Group.Application_Target_Group.arn
target_id = module.Private_EC2_Creation.Private_EC2_Details.id
}
*/

######################################################################################5

######################################################################################5

/*

module "Bastion_EC2_Creation"{
source = "./Modules/3.1 Bastion_Public_EC2"
subnet_id = module.Production_VPC.PUBLIC_SUBNET_ID_1.id
vpc_security_group_ids = [module.Bastion_PUBLIC_EC2_Security_Group.aws_security_group_public.id]
}


module "Private_EC2_Creation"{
source = "./Modules/3.2 Private_EC2"
subnet_id = module.Production_VPC.PRIVATE_SUBNET_ID_1.id
vpc_security_group_ids = [module.PRIVATE_EC2_APP_Security_Group.aws_security_group_private_id.id]
iam_instance_profile = module.EC2_Instance_Profile_IAM.s3_Full_Access_For_EC2_Instance_Profile.name

}

module "Private_DB_Creation"{
source = "./Modules/3.3 Private_Database"
subnet_id = module.Production_VPC.PRIVATE_SUBNET_ID_1.id
vpc_security_group_ids = [module.PRIVATE_EC2_APP_Security_Group.aws_security_group_private_id.id]
}
*/

######################################################################################5

######################################################################################5

#IAM INSTANCE PROFILE CREATION

module "EC2_Instance_Profile_IAM"{
source = "./Modules/8.IAM"
#depends_on = [module.Private_EC2_Creation]
}

######################################################################################5

######################################################################################5
/*
# CREATE NAT GATEWAY FOR PUBLIC ACCESS FOR PRIVATE INSTANCES 

module "NAT_Gateway_Creation"{
source = "./Modules/6.NAT_Gateway"
subnet_id = module.Production_VPC.PUBLIC_SUBNET_ID_1.id
vpc_security_group_ids = [module.Bastion_PUBLIC_EC2_Security_Group.aws_security_group_public.id]
}

######################################################################################5

######################################################################################5

#Hosted Zone creation with A record to LB 

module "HostedZone_DNS_Public"{
source = "./Modules/7.DNS"
depends_on = [module.Application_LoadBalancer,module.Application_LoadBalancer_Target_Group,module.Application_LoadBalancer_Target_Group_Attachment]
name = module.Application_LoadBalancer.Application_LoadBalancer_Access.dns_name
zone_id = module.Application_LoadBalancer.Application_LoadBalancer_Access.zone_id
}
*/



######################################################################################5

######################################################################################5


# ECS Cluster for MicroServices

