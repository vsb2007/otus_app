variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "us-central1"
}

variable zone {
  description = "Zone"
  default     = "us-central1-a"
}

variable k8sClusterName {
  description = "k8s cluster name"
  default     = "gke-test"
}

