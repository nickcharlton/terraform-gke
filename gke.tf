provider "google" {
  credentials = "${file("account.json")}"
  project     = "terraform-gke"
  region      = "europe-west2"
}

resource "google_container_cluster" "primary" {
  name               = "gke-example"
  zone               = "europe-west2-a"

  /*
  node_pool = [{
    name       = "default-pool"
    node_count = 0
  }]
  */
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

  # Delete the default node pool before spinning this one up
  depends_on = ["null_resource.default_cluster_deleter"]
}

resource "null_resource" "default_cluster_deleter" {
  provisioner "local-exec" {
    command = <<EOF
    gcloud container node-pools \
      --project terraform-gke \
      --quiet \
      delete default-pool \
      --cluster ${google_container_cluster.primary.name}
EOF
  }
}
