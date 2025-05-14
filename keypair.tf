terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
    }
  }
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "huaweicloud_compute_keypair" "keypair" {
  name       = "${var.instance_name}-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.example.private_key_pem
  filename        = "${path.module}/${var.instance_name}-key.pem"
  file_permission = "0400"
}

output "keypair_name" {
  value = huaweicloud_compute_keypair.keypair.name
}

output "private_key_content" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}