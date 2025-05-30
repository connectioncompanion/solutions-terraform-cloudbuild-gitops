terraform {
  backend "gcs" {
    bucket = "cs-tfstate-us-central1-e21376bb9dc94283b9b4b3d0b8dee742"
    prefix = "terraform"
  }
}
