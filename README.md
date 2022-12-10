# github-aws-oidc-provider

## Description

This terraform module will deploy a Github OIDC provider and accompanying `github-ci` IAM role. Managed policy ARNs can be attached to the CI role. 

The CI role can only be assumed via Github OIDC originating from a Github repository defined in `trusted_projects_refs`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack_set.github_aws_oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set) | resource |
| [aws_cloudformation_stack_set_instance.github_aws_oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set_instance) | resource |
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_organizations_organizational_units.level_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |
| [aws_organizations_organizational_units.level_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |
| [aws_organizations_organizational_units.level_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |
| [aws_organizations_organizational_units.level_4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |
| [aws_organizations_organizational_units.level_5](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_aws_oidc_provider"></a> [github\_aws\_oidc\_provider](#input\_github\_aws\_oidc\_provider) | n/a | <pre>object({<br>    enabled               = bool<br>    trusted_projects_refs = list(string)<br>    thumbprints           = list(string)<br>    managed_policy_arns   = list(string)<br>    enabled_org_units     = list(string)<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "enabled_org_units": [],<br>  "managed_policy_arns": [],<br>  "thumbprints": [],<br>  "trusted_projects_refs": []<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to create the resources in. Should be injected by Terragrunt | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack_set_arn"></a> [stack\_set\_arn](#output\_stack\_set\_arn) | ARN of the StackSet. |
| <a name="output_stack_set_id"></a> [stack\_set\_id](#output\_stack\_set\_id) | Name of the StackSet. |
| <a name="output_stack_set_instances"></a> [stack\_set\_instances](#output\_stack\_set\_instances) | StackSet name, target AWS account ID, and target AWS region separated by commas (,) |
| <a name="output_stack_set_instances_ou"></a> [stack\_set\_instances\_ou](#output\_stack\_set\_instances\_ou) | The organization root ID or organizational unit (OU) IDs specified for deployment\_targets. |
<!-- END_TF_DOCS -->