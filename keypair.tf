resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "huaweicloud_compute_keypair" "keypair" {
  name       = var.keypair_name
  public_key = tls_private_key.example.public_key_openssh
}
