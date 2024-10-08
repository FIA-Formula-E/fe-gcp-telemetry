variable "project_id" {
  type = string
  description = "The ID of your GCP project"
}

variable "region" {
  type = string
  description = "The region where your Cloud Function will be deployed"
}

variable "function_name" {
  type = string
  description = "The name of your Cloud Function"
}

variable "runtime" {
  type = string
  description = "The runtime environment for your function (e.g., python39, nodejs16)"
}

# Optional variables
variable "trigger_type" {
  type = string
  default = "http"
  description = "The type of trigger for your function (e.g., http, pubsub)"
}

variable "source_archive_bucket" {
  type = string
  description = "The name of the bucket containing your source code ZIP file"
}

variable "source_archive_object" {
  type = string
  description = "The name of the ZIP file containing your source code"
}
# Variables of Bucket 
variable "bucket_name" {
    description = "Bucket name "
    type = string   
    
}
variable "src_code_name" {
    type= string
    description = "source code name " 
    default = "src-cf-code.zip" 
}
variable "src_code_filename" {
    type = string
    description = "source code file name "
    default = ""
  
}
# Variables of Function 
variable "event_type" {
  type = string
  description = "event type"
  default = ""
}

variable "description" {
  type = string
  description = " Cloud Function for event trigger "
  default = "Cloud-Function for object finalize event."
}

variable "entry_point" {
  type = string
  description = "source code entry point "
  default = ""
}

variable "bucket_resource_to_track" {
  type = string
  description = "location of bucket to track the status of the object"
  default = ""
}
variable "function_name" {
    type = string
    description = "Cloud function name" 
    default = ""
}

 variable "runtime" {
    type = string
    description = "source code runtime" 
    default = ""
}

variable "available_memory_mb" {
    type = number
    description = "available_memory_mb" 

}


variable "timeout" {
    type = number
    description = "timeout" 
    
}

variable "max_instances" {
  type = number
  description = "max_instances" 
  default = 1
}

variable "environment_variables" {
  type = map
  description = "environment_variables " 
  default = {}
}

variable "ingress_settings" {
  type = string
  description = "ingress_settings " 
  default = "ALLOW_ALL"
}
