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

resource "google_artifact_registry_repository" "chibawest_gamecenter_bot_repos" {
  provider      = google-beta
  project       = local.project
  location      = local.region
  repository_id = "chibawest-gamecenter-bot-repos"
  description   = "Container Repository of Chibawest Gamecenter Bot"
  format        = "DOCKER"
}

resource "google_compute_network" "chibawest_gamecenter_bot_network" {
  name = "chibawest-gamecenter-bot-network"
}

resource "google_compute_firewall" "chibawest_gamecenter_bot_firewall" {
  name    = "chibawest-gamecenter-bot-firewall"
  network = google_compute_network.chibawest_gamecenter_bot_network.name

  allow {
    protocol = "icmp"
  }

  # SSH接続用
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["chibawest-gamecenter-bot"]
}

/*
resource "google_compute_instance" "chibawest_gamecenter_bot_instance" {
  name         = "chibawest-gamecenter-bot-instance"
  machine_type = "e2-micro"
  zone         = local.zone
  tags         = ["chibawest-gamecenter-bot"]

  # toolboxのgcloudを利用し
  # https://cloud.google.com/container-optimized-os/docs/concepts/features-and-benefits?hl=ja
  metadata_startup_script = <<-EOF
    mkdir -p /var/chibawest-gamecenter-bot
  
    toolbox --version \
    && toolbox -q /google-cloud-sdk/bin/gcloud secrets versions access latest \
      --secret="chibawest-gamecenter-bot-credentials-json" > \
      /var/chibawest-gamecenter-bot/google_application_credentials.json \
    && docker run -d --rm \
        -v /var/chibawest-gamecenter-bot:/chibawest-gamecenter-bot/data \
        --name chibawest-gamecenter-bot \
        mytk0u0/chibawest-gamecenter-bot:latest
  EOF

  metadata = {
    enable-oslogin = "TRUE"
  }

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.chibawest_gamecenter_bot_network.name
    access_config {}
  }

  service_account {
    email  = google_service_account.chibawest_gamecenter_bot_account.email
    scopes = ["cloud-platform"]
  }
}
*/
