#!/bin/bash

set -e

echo "==============================="
echo "KijaniKiosk IaC Pipeline"
echo "==============================="

echo ""
echo "Step 1: Terraform Init"
cd terraform
terraform init

echo ""
echo "Step 2: Terraform Apply"
terraform apply -auto-approve

echo ""
echo "Step 3: Generate Inventory"

terraform output -json > ../ansible/terraform_outputs.json

cd ../ansible

echo ""
echo "Step 4: Verify Connectivity"

ansible kijanikiosk -m ping

echo ""
echo "Step 5: Configure Servers"

ansible-playbook playbook.yml

echo ""
echo "Pipeline Complete!"
