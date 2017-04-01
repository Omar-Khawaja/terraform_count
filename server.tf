
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "server" {
  count = "${var.instance_count}"
  ami           = "${lookup(var.ami, var.region)}"
  tags {
    Name = "${var.name}-${count.index}"
  }
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_group}"]
  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}

output "ip" {
  value = ["${aws_instance.server.*.public_ip}"]
}

