provider "google" {
  project = "${var.project_id}"
  credentials = "${file("~/gcp-key/marcelo-gcp-study-account.json")}"
  region  = "us-central1"
  zone    = "us-central1-c"
}
