# Agent Registry Endpoint

This module provides a data source to discover and fetch details for generic service endpoints registered in the Agent Registry. It is used for tools that do not have a specific MCP or Agent specification, such as raw IP-based services or external APIs like Stripe.

## Usage

This data source supports filtering by `displayName` or `endpoint_id` to resolve physical URLs for the Agent Gateway.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| endpoint\_id | The system-generated ID for a generic endpoint. | `string` | `null` | no |
| filter | A filter string to find the Endpoint | `string` | `null` | no |
| location | The location of the Agent Registry resource (e.g., us-central1). | `string` | n/a | yes |
| module\_depends\_on | A list of external resources or modules that this module should depend on. | `list(string)` | `[]` | no |
| project\_id | The ID of the project in which the resource belongs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint\_attributes | Custom attributes associated with the endpoint. |
| endpoint\_create\_time | The timestamp when the endpoint was created. |
| endpoint\_description | The description of the endpoint. |
| endpoint\_display\_name | The display name of the endpoint. |
| endpoint\_id | The enpoint id. |
| endpoint\_interfaces | The connection details (URL and protocol binding) for the Endpoint. |
| endpoint\_update\_time | The timestamp when the endpoint was last updated. |
| endpoint\_urn | The globally unique URN for the endpoint. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
