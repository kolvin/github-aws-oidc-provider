# github-aws-oidc-provider

## Description

This terraform module will deploy a Github OIDC provider and accompanying `github-ci` IAM role. Managed policy ARNs can be attached to the CI role. 

The CI role can only be assumed via Github OIDC originating from a Github repository defined in `trusted_projects_refs`
