resource "null_resource" "post_install" {
  depends_on = [huaweicloud_compute_instance.ecs]

 connection {
  type        = "ssh"
  user        = "root"
  host        = huaweicloud_vpc_eip.ecs_eip.address
  private_key = tls_private_key.example.private_key_pem
}

  provisioner "file" {
    source      = "${path.module}/userdata/scripts/auto-mount.sh"
    destination = "/tmp/auto-mount.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/auto-mount.sh",
      "sudo /tmp/auto-mount.sh"
    ]
  }
}
