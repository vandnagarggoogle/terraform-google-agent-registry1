# Agent Registry MCP Server

This module provides a data source to discover and manage Model Context Protocol (MCP) servers registered in the Agent Registry. It is typically used to fetch connection details for tools like BigQuery or GKE clusters that implement the MCP JSON-RPC protocol.

## Usage

Use this data source to retrieve the `mcp_server_id` required for identity-aware proxy (IAP) bindings and gateway configurations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| filter | A filter string to find the Mcp server | `string` | `null` | no |
| location | The location of the Agent Registry resource (e.g., us-central1). | `string` | n/a | yes |
| mcp\_server\_id | The system-generated ID for an MCP server (e.g., agentregistry-0000...). | `string` | `null` | no |
| project\_id | The ID of the project in which the resource belongs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mcp\_server\_attributes | Attributes associated with the MCP Server. |
| mcp\_server\_description | The description of the MCP Server. |
| mcp\_server\_display\_name | The display name of the MCP Server. |
| mcp\_server\_id | The unique identifier for the MCP server. |
| mcp\_server\_interfaces | The connection details (URL and protocol binding) for the MCP Server. |
| mcp\_server\_tools | The list of tools available with the MCP Server, including their names, descriptions, and annotations. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->