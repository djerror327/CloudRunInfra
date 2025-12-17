# Cloud Run runtime service account
resource "google_service_account" "cloudrun_runtime" {
  account_id   = "cloudrun-runtime-sa"
  display_name = "Cloud Run Runtime SA"
}

module "cloudrun" {
  source = "./modules/cloudrun"

  project_id            = var.project_id
  region                = var.region
  service_name          = "hello-cloudrun"
  image                 = "gcr.io/cloudrun/hello"
  service_account_email = google_service_account.cloudrun_runtime.email
}
