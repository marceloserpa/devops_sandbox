resource "aws_autoscaling_group" "terraform_asg_poc" {
  launch_configuration = "${aws_launch_configuration.terraform_lc_poc.id}"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  min_size = 3
  max_size = 3
  tag {
    key = "terraform-marcelo-asg"
    value = "terraform-marcelo-asg"
    propagate_at_launch = true
  }
}
