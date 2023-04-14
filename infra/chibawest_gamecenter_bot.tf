resource "google_service_account" "chibawest_gamecenter_bot_account" {
  account_id   = "chibawest-gamecenter-bot"
  display_name = "Chibawest Gamecenter Bot"
}

resource "google_project_iam_custom_role" "chibawest_gamecenter_bot_role" {
  role_id = "chibawest_gamecenter_bot_role"
  title   = "Chibawest Gamecenter Bot's Role"
  permissions = [
    "compute.instances.start",
    "compute.instances.stop",
    "compute.instances.get",
  ]
}

resource "google_project_iam_member" "chibawest_gamecenter_bot_iam" {
  project = local.project
  role    = google_project_iam_custom_role.chibawest_gamecenter_bot_role.id
  member  = "serviceAccount:${google_service_account.chibawest_gamecenter_bot_account.email}"
}

resource "google_project_iam_member" "secret_accessor_iam" {
  project = local.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.chibawest_gamecenter_bot_account.email}"
}

resource "google_project_iam_member" "invoker_iam" {
  project = local.project
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.chibawest_gamecenter_bot_account.email}"
}

resource "google_artifact_registry_repository" "chibawest_gamecenter_bot_repos" {
  provider      = google-beta
  project       = local.project
  location      = local.region
  repository_id = "chibawest-gamecenter-bot-repos"
  description   = "Container Repository of Chibawest Gamecenter Bot"
  format        = "DOCKER"
}
