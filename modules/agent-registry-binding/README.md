# Agent Registry Binding

This module provisions and manages a Google Agent Registry Binding, which creates a secure logical link between registry resources and an authentication provider.

## Usage

module "agent_registry_binding" {
  source            = "github.com/GoogleCloudPlatform/terraform-google-agent-registry//modules/agent-registry-binding"
  project_id        = var.project_id
  location          = "us-central1"
  binding_id        = "my-binding"
  source_identifier = module.my_agent.agent_urn
  target_identifier = module.my_endpoint.endpoint_urn
  auth_provider     = module.iam_connector.id
}

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auth\_provider | The resource name of the target auth provider (e.g., from an IAM Connector). | `string` | n/a | yes |
| binding\_id | The unique ID for the binding. | `string` | n/a | yes |
| description | The description of the Binding. | `string` | `null` | no |
| display\_name | User-defined display name for the Binding. | `string` | `null` | no |
| location | The location of the binding resource. | `string` | n/a | yes |
| project\_id | The ID of the project in which the resource belongs. | `string` | n/a | yes |
| source\_identifier | The identifier of the source Agent. Format: urn:agent:{publisher}:{namespace}:{name} | `string` | n/a | yes |
| target\_identifier | The identifier of the target Agent, MCP Server, or Endpoint. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| create\_time | The timestamp marking the initial creation of the Binding resource. |
| id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/bindings/{{binding\_id}} |
| name | The resource name of the Binding. Format: projects/{project}/locations/{location}/bindings/{binding} |
| update\_time | The timestamp of the last update to the Binding resource. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->