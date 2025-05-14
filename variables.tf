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
  type = string
}
variable "secgroup_name" {
  type = string
}
variable "private_key_content" {
  type      = string
  sensitive = true
}
