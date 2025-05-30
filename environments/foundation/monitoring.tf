resource "google_monitoring_monitored_project" "cs-monitored-projects" {
  for_each = toset([
    module.cs-project-vpc-host-prod.project_id,
    module.cs-project-vpc-host-nonprod.project_id,
    module.cs-feisty-mechanic-461317-r8.project_id,
    module.cs-euphoric-graph-461317-g9.project_id,
    module.cs-vocal-airline-461317-q9.project_id,
    module.cs-sonic-falcon-461317-i9.project_id,
    module.cs-svc-prod1-svc-bkwd.project_id,
    module.cs-svc-prod2-svc-bkwd.project_id,
    module.cs-svc-nonprod1-svc-bkwd.project_id,
    module.cs-svc-nonprod2-svc-bkwd.project_id,
  ])
  metrics_scope = "locations/global/metricsScopes/${module.cs-project-logging-monitoring.project_id}"
  name          = each.value
}
