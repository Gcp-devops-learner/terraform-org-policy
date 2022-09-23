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
 
variable "organization_id" {
  description = "The organization id for putting the policy"
  type        = string
}

variable "bool_policy_folder_id" {
  description = "The folder id for putting the boolean organization policy"
  type        = list(string)
  default = []
}

variable "bool_policy_project_id" {
  description = "The project id for putting the boolean organization policy"
  type        = list(string)
  default = []
}

variable "bool_policy_exclude_folders_id" {
  description = "Set of folders to exclude from the boolean organization policy"
  type        = set(string)
  default     = []
}

variable "bool_policy_exclude_projects_id" {
  description = "Set of projects to exclude from the boolean organization policy"
  type        = set(string)
  default     = []
}

variable "bool_policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of organization, folder or project for Boolean organization Policy"
  type        = string
}


variable "vm_external_policy_folder_id" {
  description = "The folder id for putting the policy vmExternalIpAccess"
  type        = list(string)
  default = []
}

variable "vm_external_policy_project_id" {
  description = "The project id for putting the policy vmExternalIpAccess"
  type        = string
}

variable "vm_external_policy_exclude_folders_id" {
  description = "Set of folders to exclude from the policy vmExternalIpAccess"
  type        = set(string)
  default     = []
}

variable "vm_external_policy_exclude_projects_id" {
  description = "Set of projects to exclude from the policy vmExternalIpAccess"
  type        = set(string)
  default     = []
}
variable "vm_external_policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of organization, folder or project for policy vmExternalIpAccess"
  type        = string
}


# variable "domains_to_allow" {
#   description = "The list of domains to allow users from"
#   type        = list(string)
# }

variable "vms_to_allow" {
  description = "The list of VMs are allowed to use external IP, every element of the list must be identified by the VM instance name, in the form: projects/PROJECT_ID/zones/ZONE/instances/INSTANCE"
  type        = list(string)
  default     = []
}

variable "boolean_type_organization_policies" {
  description = "The list of organisation polices to be implemented"
  type = list(string)
  default= []
}