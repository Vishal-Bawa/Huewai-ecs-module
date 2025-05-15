resource "random_id" "suffix" {
  byte_length = 4
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "huaweicloud_compute_keypair" "ecs_key" {
  name       = var.keypair_name != "" ? var.keypair_name : "ecs-key-${random_id.suffix.hex}"
  public_key = tls_private_key.example.public_key_openssh
}

# Save private key to root directory
resource "local_file" "pem" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.root}/terraform-key.pem"
}

# Set permissions on the key file
resource "null_resource" "chmod_pem" {
  depends_on = [local_file.pem]

  provisioner "local-exec" {
    command = "chmod 400 ${path.root}/terraform-key.pem"
  }
}

