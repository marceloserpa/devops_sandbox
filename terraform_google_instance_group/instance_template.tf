resource "google_compute_instance_template" "instance_template" {
  name            = "appserver-template"
  machine_type    = "f1-micro"
  can_ip_forward  = true
  tags = ["http-server"]

  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata {
    foo = "bar"
    startup-script = <<SCRIPT
        apt-get -y update
        apt-get -y install nginx
        export HOSTNAME=$(hostname | tr -d '\n')
        export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
        echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /var/www/html/index.nginx-debian.html
        service nginx start
SCRIPT

  }

  lifecycle {
    create_before_destroy = true
  }
}
