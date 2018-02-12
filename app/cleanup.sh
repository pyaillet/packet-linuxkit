#!/bin/sh

API_KEY=$(cat api.key)

terraform destroy -force -var "auth_token=${API_KEY}" -var "project_id=${PROJECT_ID}" .