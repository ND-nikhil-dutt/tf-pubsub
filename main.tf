
resource "google_storage_bucket" "storage" {
  name = var.bucket_name
  project = var.project_id
  location = var.bucket_location
}

resource "google_pubsub_topic" "pubsub" {
  name = var.topic_name
  project = var.project_id
  
}

resource "google_storage_notification" "notification" {
  bucket         = var.bucket_name
  payload_format = "JSON_API_V1"
  topic          = var.topic_name
  event_types    = [var.event_type]
  depends_on = [google_pubsub_topic_iam_binding.binding]
}

resource "google_pubsub_topic_iam_binding" "binding" {
  members = ["serviceAccount:<>.iam.gserviceaccount.com"]
  role    = "roles/pubsub.publisher"
  topic   = google_pubsub_topic.pubsub.id
}

resource "google_pubsub_subscription" "echo" {
  name  = "echo"
  topic = google_pubsub_topic.pubsub.name
}
