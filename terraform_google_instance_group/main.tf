variable "project_id" {}
variable "file_account_path" {}

provider "google" {
  project = "${var.project_id}"
  credentials = "${file(var.file_account_path)}"
}
