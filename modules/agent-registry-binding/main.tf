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

resource "google_agent_registry_binding" "this" {
  provider     = google-nightly
  project      = var.project_id
  location     = var.location
  binding_id   = var.binding_id
  display_name = var.display_name
  description  = var.description

  source {
    identifier = var.source_identifier
  }

  target {
    identifier = var.target_identifier
  }

  auth_provider_binding {
    auth_provider = var.auth_provider
  }
}
