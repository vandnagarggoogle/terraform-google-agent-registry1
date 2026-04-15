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

output "mcp_server_display_name" {
  description = "The display name of the MCP Server."
  value       = data.google_agent_registry_mcp_server.default.display_name
}

output "mcp_server_description" {
  description = "The description of the MCP Server."
  value       = data.google_agent_registry_mcp_server.default.description
}

output "mcp_server_interfaces" {
  description = "The connection details (URL and protocol binding) for the MCP Server."
  value       = data.google_agent_registry_mcp_server.default.interfaces
}

output "mcp_server_tools" {
  description = "The list of tools available with the MCP Server, including their names, descriptions, and annotations."
  value       = data.google_agent_registry_mcp_server.default.tools
}

output "mcp_server_attributes" {
  description = "Attributes associated with the MCP Server."
  value       = data.google_agent_registry_mcp_server.default.attributes
}

output "mcp_server_id" {
  description = "The unique identifier for the MCP server."
  value       = coalesce(
    data.google_agent_registry_mcp_server.default.mcp_server_id,
    basename(data.google_agent_registry_mcp_server.default.id)
  )
  
  depends_on = [
    data.google_agent_registry_mcp_server.default
  ]
}

output "mcp_server_urn" {
  description = "The globally unique URN for the MCP server."
  value       = data.google_agent_registry_mcp_server.default.urn
}
