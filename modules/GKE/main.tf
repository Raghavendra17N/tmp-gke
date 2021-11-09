data "google_service_account" "gke_account" {

            account_id                       =              var.gke_service_acct
}

resource "google_container_cluster" "gke_cluster" {

            name                                =              var.cluster_name
            location                            =              var.location
            node_locations                      =              var.node_location //for multi-zonal cluster
            addons_config {

                horizontal_pod_autoscaling {

                disabled                        =              var.horizontal_pod_autoscaling
                
                }
                http_load_balancing {
                
                disabled                        =              var.http_load_balancing
                
                }
        }
            network                             =              var.network
            project                             =              var.project
            remove_default_node_pool            =              var.remove_default_pool
            initial_node_count                  =              var.node_count

}

resource "google_container_node_pool" "primary_node_pool" {

            name                                =               var.node_pool_name
            cluster                             =               google_container_cluster.gke_cluster.id
            node_count                          =               var.node_count
            node_config {
                    disk_size_gb                =               var.disk_size_gb
                    disk_type                   =               var.disk_type
                    image_type                  =               var.image_type
                    machine_type                =               var.machine_type
                    service_account             =               data.google_service_account.gke_account.email
                    oauth_scopes                =               [
                                    
                                    "https://www.googleapis.com/auth/cloud-platform"
                    ]
                    preemptible                 =               var.preemptible
                    tags                        =               var.network_tags

            }
            upgrade_settings {
                    max_surge                   =               "1"
                    max_unavailable             =               "0"
            }
}
