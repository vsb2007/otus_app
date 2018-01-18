provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_container_cluster" "primary" {
  name               = "${var.k8sClusterName}"
  zone               = "${var.zone}"
  node_version       = "1.8.5-gke.0"
  min_master_version = "1.8.5-gke.0"
  initial_node_count = 1
  node_config {
    disk_size_gb = "20"
    machine_type = "n1-standard-1"
  }
  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.k8sClusterName} --zone ${var.zone} --project ${var.project}"
  }

}

resource "google_container_node_pool" "np1" {
  name               = "my-node-pool-1"
  zone               = "${var.zone}"
  cluster            = "${google_container_cluster.primary.name}"
  node_count = 1
  node_config {
    disk_size_gb = "20"
    machine_type = "n1-standard-2"
  }
  depends_on = ["google_container_cluster.primary"]
}

resource "google_container_node_pool" "np2" {
  name               = "my-node-pool-2"
  zone               = "${var.zone}"
  cluster            = "${google_container_cluster.primary.name}"
  node_count = 1
  node_config {
    disk_size_gb = "20"
    machine_type = "n1-standard-4"
  }
  depends_on = ["google_container_node_pool.np1"]
}

module "vpc" {
  source        = "modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
