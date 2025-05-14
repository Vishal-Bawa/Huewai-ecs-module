resource "huaweicloud_compute_instance" "ecs" {
  name            = var.instance_name
  flavor_id       = var.flavor_id
  image_id        = var.image_id
  key_pair        = huaweicloud_compute_keypair.keypair.name
  security_groups = [var.secgroup_name]

  network {
    uuid = var.vpc_network_uuid
  }

  system_disk_type = "GPSSD"
  system_disk_size = 40

  data_disks {
    size = 100
    type = "GPSSD"
  }
  

  provisioner "local-exec" {
    command = "echo 'public ip---> ${var.ecs_eip_address}' > instanceIp.txt"


  }


  user_data = base64encode(templatefile("${path.module}/../userdata/script/ud.sh", {}))
}
