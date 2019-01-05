resource "google_compute_region_instance_group_manager" "instance_group_manager" {
  name                       = "appserver-igm"
  base_instance_name         = "appserver"
  instance_template          = "${google_compute_instance_template.instance_template.self_link}"
  region                     = "us-central1"
  distribution_policy_zones  = ["us-central1-a", "us-central1-b", "us-central1-f"]
  target_size                = 2
}
