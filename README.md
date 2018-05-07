# terraform-gke

This repository contains a [Terraform][] project that builds a [Google 
Kubernetes Engine][] cluster with a custom node pool.

## Requirements

* [Terraform][] >= 0.9.0
* [gcloud-sdk][]
* [kubernetes-cli][]

## Usage

1. [Enable the GKE API][gke-api],
2. [Create a service account][service-account],
3. `terraform init` to fetch the relevant plug-ins,
4. `terraform apply` to build the cluster,
5. `gcloud config set project terraform-gke` set the current project,
6. `gcloud container clusters list` (to list clusters),
7. `gcloud container clusters get-credentials gke-example` to setup
   `kubeconfig`,

Now you can access your cluster using the Kubernetes CLI: `kubectl
cluster-info`.

[Terraform]: https://terraform.io
[Google Kubernetes Engine]: https://cloud.google.com/kubernetes-engine/
[gcloud-sdk]: https://cloud.google.com/sdk/docs/
[kubernetes-cli]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[gke-api]: https://console.developers.google.com/apis/api/container.googleapis.com/overview?project=terraform-gke
[service-account]: https://console.developers.google.com/

## Author

Copyright (c) 2018 Nick Charlton <nick@nickcharlton.net>.
