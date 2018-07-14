resource "aws_launch_configuration" "terraform_lc_poc" {
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.terraform_sg_poc.id}"]
}
