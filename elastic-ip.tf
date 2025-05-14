resource "huaweicloud_vpc_eip" "ecs_eip" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    name        = "ecs-bandwidth"
    size        = 5
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_vpc_eip_associate" "ecs_eip_assoc" {
  public_ip = huaweicloud_vpc_eip.ecs_eip.address
  port_id   = huaweicloud_compute_instance.ecs.network[0].port
}

output "ecs_eip_address" {
  value = huaweicloud_vpc_eip.ecs_eip.address
}