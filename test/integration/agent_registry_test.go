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

package test

import (
	"fmt"
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

// TestAgentRegistryService verifies the creation and management of a Registry Service.
func TestAgentRegistryService(t *testing.T) {
	serviceTest := tft.NewTFBlueprintTest(t,
		tft.WithTFDir("../../examples/agent-registry-service"),
	)

	serviceTest.DefineVerify(func(assert *assert.Assertions) {
		serviceTest.DefaultVerify(assert)

		// Retrieve outputs using GetStringOutput instead of GetInference
		projectID := serviceTest.GetStringOutput("project_id")
		location := serviceTest.GetStringOutput("location")
		serviceID := serviceTest.GetStringOutput("id")

		// Verify the resource exists in GCP using gcloud alpha
		op := gcloud.Run(t, fmt.Sprintf("alpha agent-registry services describe %s --location=%s --project=%s", serviceID, location, projectID))
		assert.Equal(serviceID, op.Get("name").String(), "The Service ID in the backend must match the Terraform ID")
	})

	serviceTest.Test()
}
