module "cs-org-policy-iam_disableServiceAccountKeyCreation" {
  source  = "terraform-google-modules/org-policy/google//modules/org_policy_v2"
  version = "~> 5.2"

  policy_root      = "organization"
  policy_root_id   = var.org_id
  constraint       = "iam.disableServiceAccountKeyCreation"
  policy_type      = "boolean"
  exclude_folders  = []
  exclude_projects = []

  rules = [
    {
      enforcement = true
      allow       = []
      deny        = []
      conditions  = []
  }, ]
}
