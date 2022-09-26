# Google Cloud Organization Policy Terraform 

This Terraform module makes it easier to manage [organization policies](https://cloud.google.com/resource-manager/docs/organization-policy/overview) for your Google Cloud environment, particularly when you want to have exclusion rules. This module will allow you to set a top-level org policy and then disable it on individual projects or folders easily.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html) and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [v4.0.0](https://registry.terraform.io/modules/terraform-google-modules/-org-policy/google/v4.0.0).



### Variables
To control module's behavior, change variables' values regarding the following:

- `boolean_type_organization_policies`: set this variable with the [constraint value](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints#available_constraints) in the form `constraints/{constraint identifier}`. For example, `constraints/serviceuser.services`
- `policy_type`: Specify either `boolean` for boolean policies or `list` for list policies. (default `list`)
- `policy_for`: set one of the following values to determine where the policy is applied:
  - `organization_id`
  - `project_id`
  - `folder_id`
- `exclude_folders`: a list of folder IDs to be excluded from this policy. These folders must be lower in the hierarchy than the policy root.
- `exclude_projects`: a list of project IDs to be excluded from this policy. They must be lower in the hierarchy than the policy root.
- Boolean policies (with `policy_type: "boolean"`) can set the following variables:
  - `enforce`: if `true` or `null` then the policy is enforced at the root; if `false` then policy is not enforced at the root. (default `null`)
- List policies (with `policy_type: "list"`) can set **one of** the following variables. Only one may be set.
  - `enforce`: if `true` or `null` then policy will deny all; if `false` then policy will allow all (default `null`)
  - `allow`: list of values to include in the policy with ALLOW behavior. Set `enforce` to `null` to use it.
  - `deny`: list of values to include in the policy with DENY behavior. Set `enforce` to `null` to use it.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|boolean_type_organization_policies| List of organisation Policy Constraint for implementing Boolean policy | `set(string)` | `["compute skipDefaultNetworkCreation", "compute.requireOsLogin", "storage.uniformBucketLevelAccess", "iam.disableServiceAccountKeyCreation"]` | no |
| bool\_policy\_for | Resource hierarchy node to apply the Boolean policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| bool_policy_folder_id| Set of folders to exclude from the Boolean policy | `set(string)` | `[]` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| bool_policy_folder_id | The folder id for putting the boolean policy | `string` | `null` | no |
| bool_policy_project_id | The project id for putting the boolean policy | `string` | `null` | no |
| bool_policy_exclude_folders_id | Set of folders to exclude from the Boolean policy | `set(string)` | `[]` | no |
| bool_policy_exclude_projects_id | Set of projects to exclude from the Boolean policy | `set(string)` | `[]` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| policy\_type | The constraint type to work with (either 'boolean' or 'list') | `string` | `"list"` | no |
| enforce | If boolean constraint, whether the policy is enforced at the root; if list constraint, whether to deny all (true) or allow all | `bool` | `null` | no |
| vm_external_policy_folder_id|  The folder id for putting the VM External policy | `set(string)` | `[]` | no |
| vm_external_policy_project_id | The project id for putting the VM External policy | `string` | `null` | no |
| vm_external_policy_exclude_folders_id | Set of folders to exclude from the VM External policy | `set(string)` | `[]` | no |
| vm_external_policy_exclude_projects_id | Set of projects to exclude from the VM External policy | `set(string)` | `[]` | no |
| vm_external_policy_folder_id | The folder id for putting the VM External policy | `string` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements
### Terraform plugins
- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) >= v2.5.0

### Permissions
In order to execute this module, the Service Account you run as must have the **Organization Policy Administrator** (`roles/orgpolicy.PolicyAdmin`) role.

## Install
### Terraform
Be sure you have the correct Terraform version (0.12.x), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) >= v2.5.0


### Fast install (optional)
For a fast install, please configure the variables on init_centos.sh  or init_debian.sh script and then launch it.

The script will do:
- Environment variables setting
- Installation of base packages like wget, curl, unzip, gcloud, etc.
