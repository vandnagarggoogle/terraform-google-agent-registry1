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

locals {
  # Base roles for management operations
  base_roles = [
    "roles/iam.serviceAccountUser",
    "roles/config.agent",
    "roles/storage.admin",
    "roles/networkservices.admin",
    "roles/networksecurity.admin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/apphub.admin"
  ]

  # Module-specific IAM specifications
  per_module_roles = {
    # Agent Registry Service: Requires Admin access for resource provisioning
    agent-registry-service = concat(local.base_roles, [
      "roles/agentregistry.admin"
    ]),

    # Agent Registry Binding: Requires Admin access for lifecycle management
    agent-registry-binding = concat(local.base_roles, [
      "roles/agentregistry.admin"
    ]),

    # MCP Server: Requires Viewer access for discovery and tool retrieval
    agent-registry-mcp-server = concat(local.base_roles, [
      "roles/agentregistry.viewer"
    ]),

    # Endpoint: Requires Viewer access for specification fetching
    agent-registry-endpoint = concat(local.base_roles, [
      "roles/agentregistry.viewer"
    ]),

    # Agent: Requires Viewer access for metadata retrieval
    agent-registry-agent = concat(local.base_roles, [
      "roles/agentregistry.viewer"
    ])
  }

  # Unique union of all roles required for the CI service account
  int_required_roles = tolist(toset(flatten(values(local.per_module_roles))))
}

# 1. CI Service Account Definition
resource "google_service_account" "int_test" {
  project      = var.project_id
  account_id   = "ci-account"
  display_name = "Agent Registry Integration Test Account"
}

# 2. Project-Level Role Grants
resource "google_project_iam_member" "int_test" {
  count = length(local.int_required_roles)

  project = var.project_id
  role    = local.int_required_roles[count.index]
  member  = "serviceAccount:${google_service_account.int_test.email}"
}

# 3. Generate Service Account Key for Docker/CI usage
resource "google_service_account_key" "int_test" {
  service_account_id = google_service_account.int_test.id
}

# 4. Output the key for use in SERVICE_ACCOUNT_JSON environment variable
output "service_account_key" {
  description = "The JSON key for the CI service account. Use this as SERVICE_ACCOUNT_JSON."
  value       = google_service_account_key.int_test.private_key
  sensitive   = true
}
