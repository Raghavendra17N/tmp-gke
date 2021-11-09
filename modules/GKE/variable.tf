variable "cluster_name" {
  type    = string
  default = "gke-cluster1"
}

variable "location" {
  type        = string
  default     = "us-central1-a"
  description = "If zone is provided the cluster will be zonal cluster, with single cluster master. if region the master will be created accross the zones"
}

variable "gke_service_acct" {
  type        = string
  description = "Service account for creating GKE cluster"
}

variable "node_location" {
  type    = set(string)
  default = []
}

variable "horizontal_pod_autoscaling" {
  type    = bool
  default = true
}

variable "http_load_balancing" {
  type    = bool
  default = true
}

variable "network" {
  type    = string
  default = "default"

}

variable "project" {
  type    = string
  default = ""
}

variable "remove_default_pool" {
  type    = bool
  default = true
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_pool_name" {
  type    = string
  default = "gke-pool-1"
}

variable "disk_size_gb" {
  type    = number
  default = 10
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "image_type" {
  type    = string
  default = "cos"
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "preemptible" {
  type    = bool
  default = true
}

variable "network_tags" {
  type    = list(string)
  default = ["gke", "cluster"]
}
