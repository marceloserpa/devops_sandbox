

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "${lookup(var.instance_type, var.env)}"
  security_groups = "${var.sgs}"
}
