# KijaniKiosk Infrastructure Hardening Report

## Executive Summary

This project implements Infrastructure as Code (IaC) using Terraform and configuration management using Ansible to provision and configure AWS EC2 instances for the KijaniKiosk application. The infrastructure consists of three Ubuntu EC2 instances (API, Payments, and Logs) protected by an AWS Security Group and configured automatically using Ansible.

The primary objective was to build a repeatable, automated, and secure infrastructure deployment process while minimizing manual configuration and reducing configuration drift.

---

# Infrastructure Overview

Components deployed include:

- AWS EC2 Instances
- AWS Security Group
- SSH Key Pair Authentication
- Terraform reusable modules
- Dynamic Ubuntu AMI lookup
- Ansible inventory
- Automated Nginx installation

---

# Security Controls

| Security Control | Risk Mitigated |
|------------------|----------------|
| IAM User with programmatic access | Prevents use of root credentials |
| Security Groups | Restricts inbound network traffic |
| SSH Key Authentication | Eliminates password-based attacks |
| Terraform Variables | Prevents hardcoded configuration |
| Dynamic Ubuntu AMI | Ensures deployment of supported operating systems |
| Terraform Modules | Reduces configuration duplication and human error |
| Ansible Idempotency | Prevents configuration drift |
| Git Version Control | Provides change tracking and rollback capability |

---

# Risks Identified

Potential risks include:

- Public SSH access (0.0.0.0/0) should be restricted in production.
- Local Terraform state may be lost if not backed up.
- Static inventory requires regeneration after infrastructure changes.
- No remote Terraform backend has been configured.
- No automated CI/CD validation pipeline.

---

# Engineering Trade-offs

The project prioritised simplicity and reproducibility over production-scale complexity.

Examples include:

- Local Terraform state instead of S3 backend.
- Static SSH key authentication.
- Single-region deployment.
- Manual approval before Terraform apply.

These decisions reduce implementation complexity while maintaining repeatable infrastructure deployment.

---

# Recommendations

Future improvements include:

- Configure remote Terraform backend using Amazon S3.
- Implement DynamoDB state locking.
- Restrict SSH access to trusted IP addresses.
- Use Ansible Roles instead of a single playbook.
- Configure GitHub Actions for automated validation.
- Use AWS Systems Manager Session Manager instead of SSH.

---

# Conclusion

The project successfully demonstrates modern Infrastructure as Code practices through reusable Terraform modules and automated server configuration using Ansible. The resulting infrastructure is repeatable, maintainable, and significantly reduces manual operational effort compared to traditional server provisioning approaches.
