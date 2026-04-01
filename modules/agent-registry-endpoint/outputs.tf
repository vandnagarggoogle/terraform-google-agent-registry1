/**
 * Copyright 2021 Google LLC
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

output "endpoint_display_name" {
  description = "The display name of the endpoint."
  value       = data.google_agent_registry_endpoint.default.display_name
}

output "endpoint_description" {
  description = "The description of the endpoint."
  value       = data.google_agent_registry_endpoint.default.description
}

output "endpoint_interfaces" {
  description = "The connection details (URL and protocol binding) for the Endpoint."
  value       = data.google_agent_registry_endpoint.default.interfaces
}

output "endpoint_attributes" {
  description = "Custom attributes associated with the endpoint."
  value       = data.google_agent_registry_endpoint.default.attributes
}

output "endpoint_create_time" {
  description = "The timestamp when the endpoint was created."
  value       = data.google_agent_registry_endpoint.default.create_time
}

output "endpoint_update_time" {
  description = "The timestamp when the endpoint was last updated."
  value       = data.google_agent_registry_endpoint.default.update_time
}

output "endpoint_id" {
  description = "The enpoint id."
  value       = data.google_agent_registry_endpoint.default.endpoint_id
}
