# KijaniKiosk Infrastructure as Code Pipeline

## Overview

This project provisions AWS infrastructure using Terraform and configures Linux servers using Ansible.

## Technologies

- AWS EC2
- Terraform
- Ansible
- Ubuntu Linux
- Git
- GitHub

## Architecture

Developer

↓

Terraform

↓

AWS EC2 (API, Payments, Logs)

↓

Security Group

↓

Ansible

↓

Nginx Deployment

## Features

- Reusable Terraform Modules
- Dynamic Ubuntu AMI Lookup
- Security Groups
- Three EC2 Instances
- Automated Nginx Installation
- Idempotent Infrastructure
- Dynamic Inventory Generation

## Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply

ansible-playbook playbook.yml
```
