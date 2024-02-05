 resource "google_compute_instance" "vm_instance" {
   name         = "terraform-instance"
   machine_type = "n1-standard-1"

   boot_disk {
     initialize_params {
       image = "debian-cloud/debian-9"
     }
   }

   network_interface {
     network = "default"
     access_config {
       // Ephemeral IP
     }
   }
 }

 # Create a Google Cloud Storage bucket
 resource "google_storage_bucket" "storage_bucket" {
   name     = "my-terraform-bucket"
   location = "US"
 }
