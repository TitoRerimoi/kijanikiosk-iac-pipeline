#!/bin/bash

set -e

cd ../terraform

IPS=$(terraform output -json server_public_ips)

API=$(echo "$IPS" | jq -r '.api')
PAYMENTS=$(echo "$IPS" | jq -r '.payments')
LOGS=$(echo "$IPS" | jq -r '.logs')

cd ../ansible

cat > inventory.ini <<EOF
[kijanikiosk]
api ansible_host=$API
payments ansible_host=$PAYMENTS
logs ansible_host=$LOGS

[kijanikiosk:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=../terraform/kijanikiosk-key.pem
EOF

echo "Inventory generated successfully."
