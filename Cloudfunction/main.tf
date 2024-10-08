terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}

/* Bucket creation */
resource google_storage_bucket "bucket"{
  name = var.bucket_name
  location = var.region
  project = var.project_id
  
}

/* uploading an object to bucket */
resource "google_storage_bucket_object" "srccode" {
  name = var.src_code_name
  bucket = google_storage_bucket.bucket.name
  source = var.src_code_filename
 # project = var.project_id
}

/* Cloud Function trigger with cloud storage object creation  */
resource "google_cloudfunctions_function" "fun_from_tf" {
  name                  = var.function_name
  runtime               = var.runtime
  description           = var.description
  available_memory_mb   = var.available_memory_mb
  project               = var.project_id
  timeout               = var.timeout
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.srccode.name  
  entry_point           = var.entry_point
  max_instances         = var.max_instances
  environment_variables = var.environment_variables
  ingress_settings      = var.ingress_settings
  region                = var.region

  event_trigger {
    event_type     = var.event_type
    resource       = var.bucket_resource_to_track  
    
  }

}
