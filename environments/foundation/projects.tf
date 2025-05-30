module "cs-project-vpc-host-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-bs653-af649"
  org_id     = var.org_id
  folder_id  = local.folder_map["Common"].id

  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
}

module "cs-project-vpc-host-nonprod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-og719-oc028"
  org_id     = var.org_id
  folder_id  = local.folder_map["Common"].id

  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
}

module "cs-project-logging-monitoring" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "central-logging-monitoring"
  project_id = "central-log-monitor-rq789-va42"
  org_id     = var.org_id
  folder_id  = local.folder_map["Common"].id

  billing_account = var.billing_account
  activate_apis = [
    "compute.googleapis.com",
    "monitoring.googleapis.com",
  ]
}

module "cs-feisty-mechanic-461317-r8" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "live-api-agent-dev"
  project_id = "feisty-mechanic-461317-r8"
  org_id     = var.org_id
  folder_id  = local.folder_map["Development"].id

  billing_account = var.billing_account
}

module "cs-euphoric-graph-461317-g9" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "live-api-agent-staging"
  project_id = "euphoric-graph-461317-g9"
  org_id     = var.org_id
  folder_id  = local.folder_map["Non-Production"].id

  billing_account = var.billing_account
}

module "cs-vocal-airline-461317-q9" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "live-api-agent-prod"
  project_id = "vocal-airline-461317-q9"
  org_id     = var.org_id
  folder_id  = local.folder_map["Production"].id

  billing_account = var.billing_account
}

module "cs-sonic-falcon-461317-i9" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 16.0"

  name       = "cicd"
  project_id = "sonic-falcon-461317-i9"
  org_id     = var.org_id
  folder_id  = local.folder_map["Common"].id

  billing_account = var.billing_account
}
