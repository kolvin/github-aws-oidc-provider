variable "region" {
  description = "The AWS region to create the resources in. Should be injected by Terragrunt"
  type        = string
  default     = "eu-west-1"
}

variable "github_aws_oidc_provider" {
  type = object({
    enabled               = bool
    trusted_projects_refs = list(string)
    thumbprints           = list(string)
    managed_policy_arns   = list(string)
    enabled_org_units     = list(string)
  })
  default = {
    enabled               = false
    trusted_projects_refs = []
    managed_policy_arns   = []
    thumbprints           = []
    enabled_org_units     = []
  }
}
