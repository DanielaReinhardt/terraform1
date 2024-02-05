variable "project_id" {
  description = "The ID of the GCP project"
}

variable "region" {
  description = "The region where resources will be created"
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the service account key JSON file"
}
