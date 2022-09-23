
/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
module "organization_policies_type_boolean" {
  for_each        = toset(var.boolean_type_organization_policies)
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.1"
  organization_id = var.organization_id
  policy_type     = "boolean"
  policy_for      = var.bool_policy_for
  enforce         = "true"
  constraint      = "constraints/${each.value}"
  exclude_folders  = var.bool_policy_exclude_folders_id
  exclude_projects = var.bool_policy_exclude_projects_id
}


/******************************************
  Compute org policies
*******************************************/

module "org_vm_external_ip_access" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.1"
  organization_id = var.organization_id
  # folder_id       = var.vm_external_policy_folder_id
  project_id        = var.vm_external_policy_project_id
  policy_for        = var.vm_external_policy_for
  policy_type       = "list"
  enforce           = "true"
  allow             = var.vms_to_allow
  constraint      = "constraints/compute.vmExternalIpAccess"
  exclude_folders  = var.vm_external_policy_exclude_folders_id
  exclude_projects = var.vm_external_policy_exclude_projects_id
}