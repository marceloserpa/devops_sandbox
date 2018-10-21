resource "google_compute_instance" "compute" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  tags = ["${var.web_tag}"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network       = "${var.network_id}"
    access_config = {
    }
  }

  metadata_startup_script = "sudo apt-get update -y; sudo apt-get install apache2 -y;"

}
