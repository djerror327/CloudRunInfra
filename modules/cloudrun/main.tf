resource "google_cloud_run_service" "this" {
  name     = var.service_name
  location = var.region
  project  = var.project_id

  template {
    spec {
      service_account_name = var.service_account_email

      containers {
        image = var.image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Public access
resource "google_cloud_run_service_iam_member" "public" {
  project  = var.project_id
  location = var.region
  service  = google_cloud_run_service.this.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
