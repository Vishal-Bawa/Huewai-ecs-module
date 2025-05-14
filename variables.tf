variable "region" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type      = string
  sensitive = true
}
variable "instance_name" {
  type = string
}
variable "flavor_id" {
  type = string
}
variable "image_id" {
  type = string
}
variable "vpc_network_uuid" {
  type = string
}
variable "keypair_name" {
  description = "Name of the key pair"
  type        = string
  default     = ""  # Ab yeh optional hai
}

variable "secgroup_name" {
  description = "Name of the security group"
  type        = string
  default     = "ecs-default-sg"
}

variable "private_key_content" {
  description = "SSH private key content (auto-generated if not given)"
  type        = string
  default     = ""  # Optional bana diya
}

