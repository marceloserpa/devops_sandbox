resource "aws_security_group" "terraform_sg_poc" {
  name = "terraform_sg_poc"
  tags {
    Name = "terraform_sg_poc"
  }
  description = "only connection from my house"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["${var.home_ip}/32"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["${var.home_ip}/32"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.home_ip}/32"]
  }
}
