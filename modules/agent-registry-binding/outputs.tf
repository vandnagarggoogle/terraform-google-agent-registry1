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

output "id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/bindings/{{binding_id}}"
  value       = google_agent_registry_binding.this.id
}

output "name" {
  description = "The resource name of the Binding. Format: projects/{project}/locations/{location}/bindings/{binding}"
  value       = google_agent_registry_binding.this.name
}

output "create_time" {
  description = "The timestamp marking the initial creation of the Binding resource."
  value       = google_agent_registry_binding.this.create_time
}

output "update_time" {
  description = "The timestamp of the last update to the Binding resource."
  value       = google_agent_registry_binding.this.update_time
}
