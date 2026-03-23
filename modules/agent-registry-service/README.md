# Agent Registry Service

This module provides the primary resource to deploy and manage the full lifecycle of AI agent interfaces and capabilities within the Google Cloud Agent Registry. It supports the registration of first-party (1P), second-party (2P), and third-party (3P) agents and tools.

## Usage

Refer to the root module for end-to-end integration examples including Agent Engine and Agent Gateway connectivity.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| agent\_spec | The spec of the Agent. Mutually exclusive with mcp\_server\_spec and endpoint\_spec. | <pre>object({<br>    type    = string # NO_SPEC or A2A_AGENT_CARD<br>    content = string # JSON format content<br>  })</pre> | `null` | no |
| description | The description of the service. | `string` | `null` | no |
| display\_name | User-defined display name for the Service (max 63 characters). | `string` | `null` | no |
| endpoint\_spec | The spec of the Endpoint. Mutually exclusive with agent\_spec and mcp\_server\_spec. | <pre>object({<br>    type = string # NO_SPEC<br>  })</pre> | `null` | no |
| interfaces | The connection details for the Service. | <pre>list(object({<br>    url              = string<br>    protocol_binding = string # JSONRPC, GRPC, or HTTP_JSON<br>  }))</pre> | `[]` | no |
| location | The location of the resource. | `string` | n/a | yes |
| mcp\_server\_spec | The spec of the MCP Server. Mutually exclusive with agent\_spec and endpoint\_spec. | <pre>object({<br>    type    = string # NO_SPEC or TOOL_SPEC<br>    content = string # JSON format content<br>  })</pre> | `null` | no |
| project\_id | The project ID to deploy to. | `string` | n/a | yes |
| service\_id | The name of the service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| agent | Details of the Agent configuration. |
| create\_time | The timestamp when the resource was created. |
| endpoint | Details of the Endpoint configuration. |
| id | The ID of the Agent Registry Service. |
| mcp\_server | Details of the MCP Server configuration. |
| update\_time | The timestamp when the resource was updated. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->