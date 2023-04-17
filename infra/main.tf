locals {
  project = "chibawest-gamecenter"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

provider "google" {
  project = local.project
  region  = local.region
  zone    = local.zone
}

resource "google_artifact_registry_repository" "chibawest_gamecenter_repos" {
  provider      = google-beta
  project       = local.project
  location      = local.region
  repository_id = "chibawest-gamecenter"
  description   = "Container Repository of Chibawest Gamecenter Bot"
  format        = "DOCKER"
}
