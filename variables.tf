variable "instance_name" { type = string }
variable "flavor_id" { type = string }
variable "image_id" { type = string }
variable "vpc_network_uuid" { type = string }
#variable "keypair_name" { type = string }
variable "secgroup_name" { type = string }
variable "ecs_eip_address" { type = string }
#variable "private_key_content" {
  #type      = string
  #sensitive = true
#}
