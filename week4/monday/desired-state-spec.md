# KijaniKiosk API Server - Desired State Specification

## Identity

- Name: kijanikiosk-api-staging
- Environment tag: staging
- Owner tag: amina

## Compute

- Provider: Multipass
- Region: Local machine
- Instance type: 1 CPU, 1 GB RAM
- Operating system: Ubuntu 22.04 LTS

## Networking

- VPC: N/A (local virtual network)
- Subnet: Default Multipass network
- Assign public IP: No

## Access Control

- SSH access: Multipass shell
- HTTP access: Not configured
- All other inbound: Default
- All outbound: Allowed

## Storage

- Root volume: 5 GB

## Authentication

- SSH key pair name: Managed automatically by Multipass

## What must NOT exist on this server after provisioning

- No password authentication
- No unnecessary services
- No world-writable directories outside /tmp

## Open Questions

- How would these networking settings translate to AWS VPCs?
- What image ID would Terraform use in AWS?
- How are security groups represented for a local VM?

## Hardest Decision and Why

The hardest decision was networking. Multipass abstracts most networking details, whereas cloud providers require explicit choices such as VPCs, subnets, routing, and security groups. It was not immediately obvious how the local virtual network maps to cloud networking, and I expect Terraform to make these relationships clearer because they must be defined explicitly in code.
