resource "google_compute_firewall" "firewall-rules" {
  name    = "enable-8080-firewall"
  network = "${var.network_id}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  source_tags = ["${var.web_tag}"]
}
