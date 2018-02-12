#!/bin/sh

API_KEY=$(cat api.key)

terraform init

terraform apply -auto-approve -var "auth_token=${API_KEY}" -var "project_id=${PROJECT_ID}" .