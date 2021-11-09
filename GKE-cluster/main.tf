terraform {
  required_version = ">= 0.12"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.86.0"
    }
  }
  backend "gcs" {
    bucket    =   "pg-us-n-app-793574-tfstate"
    prefix    =   "env/dev"
  }
  
}

provider "google" {
  project     = var.project
  region      = var.region
  
}

module "gke" {

  source                = "../modules/GKE"
  cluster_name          = "sdm-gke-cluster"
  location              = "us-central1-a"
  gke_service_acct      = "543334655747-compute@developer.gserviceaccount.com"
  project               = var.project
  network               = "default"
}
