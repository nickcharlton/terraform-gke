provider "google" {
  credentials = "${file("account.json")}"
  project     = "terraform-gke"
  region      = "europe-west2"
}

resource "google_container_cluster" "primary" {
  name                     = "gke-example"
  zone                     = "europe-west2-a"
  remove_default_node_pool = true

  node_pool {
    name = "default-pool"
  }
}

resource "google_container_node_pool" "primary_pool" {
  name       = "primary-pool"
  cluster    = "${google_container_cluster.primary.name}"
  zone       = "europe-west2-a"
  node_count = "2"

  node_config {
    machine_type = "n1-standard-1"
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
