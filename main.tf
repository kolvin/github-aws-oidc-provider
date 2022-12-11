resource "aws_cloudformation_stack_set" "github_aws_oidc_provider" {
  for_each = var.github_aws_oidc_provider.enabled ? toset(["this"]) : []

  name = "github-aws-oidc-provider"

  template_body = templatefile("${path.module}/templates/stackset.yaml.tftpl", {
    thumbprints           = var.github_aws_oidc_provider.thumbprints
    managed_policy_arns   = var.github_aws_oidc_provider.managed_policy_arns
    trusted_projects_refs = [for project in var.github_aws_oidc_provider.trusted_projects_refs : format("repo:%s:*", project)]
  })

  capabilities     = ["CAPABILITY_NAMED_IAM"]
  permission_model = "SERVICE_MANAGED"

  auto_deployment {
    enabled                          = true
    retain_stacks_on_account_removal = false
  }

  lifecycle {
    ignore_changes = [administration_role_arn]
  }
}

resource "aws_cloudformation_stack_set_instance" "github_aws_oidc_provider" {
  for_each = var.github_aws_oidc_provider.enabled && length(var.github_aws_oidc_provider.enabled_org_units) > 0 ? toset(["this"]) : []

  deployment_targets {
    organizational_unit_ids = [for ou in var.github_aws_oidc_provider.enabled_org_units : local.all_org_units[ou].id]
  }

  region         = var.region
  stack_set_name = aws_cloudformation_stack_set.github_aws_oidc_provider["this"].name
}
