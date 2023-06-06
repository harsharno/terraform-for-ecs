resource "aws_ecs_cluster" "prod_ecs_cluster" {
  name = "${var.app_name}-Prod"
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "${var.app_name}-prod" # Create a "pemfile" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./${var.app_name}-prod.pem"
  }
}