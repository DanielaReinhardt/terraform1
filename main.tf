# Google Compute Engine VM Instance
resource "google_compute_instance" "vm_instance" {
  name         = "instance-terraform"
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

# Google Cloud SQL Database Instance
resource "google_sql_database_instance" "database_instance" {
  name             = "my-sql-instance"
  database_version = "MYSQL_5_7"
  region           = "us-central1"  # Set appropriate region

  settings {
    tier             = "db-f1-micro"  # Small-scale configuration
    activation_policy = "ALWAYS"
    ip_configuration {
      ipv4_enabled = true
    }
  }
}

# Second Google Compute Engine VM Instance
resource "google_compute_instance" "second_vm_instance" {
  name         = "second-vm-instance"
  machine_type = "n1-standard-2"  # Different machine type from the first VM

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# Google Cloud Storage Bucket
resource "google_storage_bucket" "storage_bucket" {
  name     = "my-terraform-bucket"
  location = "us-central1"  # Set appropriate location

  storage_class = "STANDARD"
}
