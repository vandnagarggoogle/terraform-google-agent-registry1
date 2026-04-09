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

# Example configuration for testing the MCP Server module
module "mcp_server" {
  source     = "../../modules/agent-registry-mcp-server"
  project_id = var.project_id
  location   = "us-central1"

  # A filter used to discover a specific MCP server (e.g., by URN)
  filter = "mcpServerId:\"urn:mcp:googleapis.com:projects:${var.project_id}:locations:global:bigquery\""
}

output "mcp_server_id" {
  value = module.mcp_server.mcp_server_id
}
