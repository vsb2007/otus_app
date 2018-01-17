resource "google_compute_firewall" "firewall_k8s" {
  name    = "default-allow-k8s"
  network = "default"

  allow {
    protocol = "${var.k8s_protocol}"
    ports    = "${var.k8s_ports}"
  }

  source_ranges = "${var.source_ranges}"
}

resource "google_compute_firewall" "firewall_k8s_80" {
  name    = "default-allow-k8s-80"
  network = "default"

  allow {
    protocol = "${var.k8s_protocol}"
    ports    = ["80"]
  }

  source_ranges = "${var.source_ranges}"
}
