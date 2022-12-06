variable vpc_id{}

variable public_subnet_id_1{}


variable public_subnet_id_2{}


variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type = list
  default     = null
}



