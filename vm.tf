resource "google_compute_instance" "terraform-vm" {
  name         = "managenet-vm-4"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

//tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
/*
  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }
*/
  network_interface {
    network = "managementnet"
    subnetwork = "managesubnet-1"
//        access_config {
      // Ephemeral public IP  if access config is not specified, the instance will not have a public IP address
//    }
  }
}
/*
  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
*/