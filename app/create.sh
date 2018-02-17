#!/bin/sh

export API_KEY=$(cat api.key)

terraform init

terraform apply -auto-approve -var "auth_token=${API_KEY}" -var "project_id=${PROJECT_ID}" .

IP_ADDRESS=$(curl -H "X-Auth-Token: ${API_KEY}" https://api.packet.net/projects/${PROJECT_ID}/devices | jq -r '.devices[0].ip_addresses[0].address')
echo "The VM IP address is: ${IP_ADDRESS}"
echo "you can connect to it by launching: "
echo "ssh ${IP_ADDRESS}"

