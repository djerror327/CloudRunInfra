terraform {
  backend "gcs" {
    bucket = "cloudrun-infra-tf-state"
    prefix = "cloudrun"
  }
}
