/**
 * Copyright 2026 Google LLC
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

variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "location" {
  description = "The location of the binding resource."
  type        = string
}

variable "binding_id" {
  description = "The unique ID for the binding."
  type        = string
}

variable "display_name" {
  description = "User-defined display name for the Binding."
  type        = string
  default     = null
}

variable "description" {
  description = "The description of the Binding."
  type        = string
  default     = null
}

variable "source_identifier" {
  description = "The identifier of the source Agent. Format: urn:agent:{publisher}:{namespace}:{name}"
  type        = string
}

variable "target_identifier" {
  description = "The identifier of the target Agent, MCP Server, or Endpoint."
  type        = string
}

variable "auth_provider" {
  description = "The resource name of the target auth provider (e.g., from an IAM Connector)."
  type        = string
}
