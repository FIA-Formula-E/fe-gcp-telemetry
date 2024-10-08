terraform {
  backend "gcs" {
    bucket = "fe-gcp-telemetry-bucket"
    prefix = "terraform/state"
  }
}