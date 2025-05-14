resource "huaweicloud_networking_secgroup" "secgroup" {
  name        = var.secgroup_name
  description = "Security group for ECS instance"
}

locals {
  ingress_ports = ["22", "80", "443", "8000", "8001", "8002", "5432"]
}

resource "huaweicloud_networking_secgroup_rule" "secgroup_ingress_rules" {
  for_each           = toset(local.ingress_ports)
  direction          = "ingress"
  ethertype          = "IPv4"
  protocol           = "tcp"
  ports              = each.value
  remote_ip_prefix   = "0.0.0.0/0"
  security_group_id  = huaweicloud_networking_secgroup.secgroup.id
}

resource "huaweicloud_networking_secgroup_rule" "secgroup_rule_egress" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = "1-65535"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
}
