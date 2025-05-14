output "ecs_eip_address" {
  value = huaweicloud_vpc_eip.ecs_eip.address
}
output "keypair_name" {
  value = huaweicloud_compute_keypair.keypair.name
}
output "secgroup_name" {
  value = huaweicloud_networking_secgroup.secgroup.name
}
