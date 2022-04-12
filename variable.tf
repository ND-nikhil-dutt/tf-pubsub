variable "project_id" {
  description = "Project Id"
  type        = string
  default     = "nik-learning-1"
}

variable "bucket_name" {
  description = "Source bucket name on which pubsub notification is configured"
  type        = string
  default     = "nik-learning-pubsub"
}

variable "topic_name" {
  description = "The topic in Pub/Sub that receives notifications."
  type        = string
  default     = "nik"
}

variable "event_type" {
  description = "The events that trigger a notification to be sent."
  type        = string
  default     = "OBJECT_FINALIZE"
}

variable "bucket_location" {
  type = string
  default = "us-central1"
}
