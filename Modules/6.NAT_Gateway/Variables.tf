variable subnet_id{}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type = list
  default = null
}
