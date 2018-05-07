# README

1. Enable the GKE API: https://console.developers.google.com/apis/api/container.googleapis.com/overview?project=terraform-gke
2. Create a service account w/Google: https://console.developers.google.com/
3. `terraform init` to fetch the relevant plug-ins.
4. `terraform apply` to build the cluster.
5. `gcloud config set project terraform-gke` set the current project
6. `gcloud container clusters list` (to list clusters)
7. `gcloud container clusters get-credentials gke-example` setup kubeconfig
  - now `kubectl cluster-info` should work
