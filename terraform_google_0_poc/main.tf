
variable "project_id" {}

provider "google" {
  project = "${var.project_id}"
  credentials = "${file("~/gcp-key/marcelo-gcp-study-account.json")}"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network       = "default"
    access_config = {
    }
  }
}
