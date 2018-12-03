provider "google" {
  credentials = "${file("secrets/account.json")}"
  project     = "gke-tf-demo"
  region      = "us-west1"
}
