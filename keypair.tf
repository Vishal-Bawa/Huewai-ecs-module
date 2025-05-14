resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "huaweicloud_compute_keypair" "ecs_key" {
  name       = var.keypair_name != "" ? var.keypair_name : "ecs-key-${random_id.suffix.hex}"
  public_key = tls_private_key.example.public_key_openssh
}
