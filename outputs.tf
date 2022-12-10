output "stack_set_id" {
  value       = aws_cloudformation_stack_set.github_aws_oidc_provider["this"].id
  description = "Name of the StackSet."
}

output "stack_set_arn" {
  value       = aws_cloudformation_stack_set.github_aws_oidc_provider["this"].arn
  description = "ARN of the StackSet."
}

output "stack_set_instances" {
  value       = aws_cloudformation_stack_set_instance.github_aws_oidc_provider["this"].id
  description = "StackSet name, target AWS account ID, and target AWS region separated by commas (,)"
}

output "stack_set_instances_ou" {
  value       = aws_cloudformation_stack_set_instance.github_aws_oidc_provider["this"].organizational_unit_id
  description = "The organization root ID or organizational unit (OU) IDs specified for deployment_targets."
}
