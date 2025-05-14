output "ecs_eip_address" {
  value = huaweicloud_vpc_eip.ecs_eip.address
}
output "keypair_name" {
  value = huaweicloud_compute_keypair.ecs_key.name
}

output "secgroup_name" {
  value = huaweicloud_networking_secgroup.secgroup.name
}
output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
output "pem_file_path" {
  value = local_file.pem.filename
}
