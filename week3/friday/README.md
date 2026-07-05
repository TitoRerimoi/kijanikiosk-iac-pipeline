# DevOps Linux Automation (KijaniKiosk)

## Overview

This project demonstrates Linux administration and DevOps fundamentals through automated provisioning and hardening of a simulated application environment.

The solution uses Bash scripting to configure users, groups, permissions, ACLs, systemd services, firewall rules, logging, monitoring, and verification controls while maintaining idempotent behavior.

## Features

* Package installation and validation
* Service account creation
* Group management
* Directory structure creation
* Linux permissions and ACLs
* systemd service deployment
* UFW firewall configuration
* Journal persistence
* Log rotation
* Health monitoring
* Automated verification
* Idempotent provisioning

## Technologies Used

* Ubuntu Linux
* Bash
* systemd
* ACL
* UFW
* Logrotate

## Project Structure

```text
.
├── kijanikiosk-provision.sh
├── access-model-final.md
├── hardening-decisions.md
├── integration-notes.md
├── kk-payments-hardening.md
├── post-remediation-verification.txt
├── pre-provisioning-audit.txt
├── provision-run-clean.log
├── provision-run-dirty.log
└── reflection.md
```

## Key DevOps Concepts

* Infrastructure Provisioning
* Linux Hardening
* Least Privilege Access
* Idempotency
* Monitoring and Verification
* Service Management
* Automation

## Future Improvements

* Convert Bash automation to Ansible
* Containerize services with Docker
* Add CI/CD using GitHub Actions
* Add monitoring with Prometheus
* Provision infrastructure using Terraform# DevOps Linux Automation (KijaniKiosk)

## Overview

This project demonstrates Linux administration and DevOps automation by provisioning and hardening a simulated application environment using Bash scripting.

The automation configures Linux users and groups, file permissions, Access Control Lists (ACLs), systemd services, firewall rules, log management, and health verification while maintaining idempotent execution.

---

## Features

* Automated package installation and validation
* Service account and group creation
* Directory structure provisioning
* Linux permissions and Access Control Lists (ACLs)
* systemd service deployment and management
* UFW firewall configuration
* Persistent system logging
* Log rotation using Logrotate
* Health monitoring and verification
* Idempotent provisioning

---

## Technologies Used

* Ubuntu Linux
* Bash
* systemd
* ACL
* UFW
* Logrotate

---

## Project Structure

```text
.
├── README.md
├── docs
│   ├── access-model-final.md
│   ├── hardening-decisions.md
│   ├── integration-notes.md
│   ├── kk-payments-hardening.md
│   └── reflection.md
│
├── logs
│   ├── pre-provisioning-audit.txt
│   ├── post-remediation-verification.txt
│   ├── provision-run-clean.log
│   └── provision-run-dirty.log
│
└── scripts
    └── kijanikiosk-provision.sh
```

---

## Skills Demonstrated

* Linux Administration
* Bash Scripting
* Infrastructure Provisioning
* Linux Permissions
* Access Control Lists (ACLs)
* systemd Service Management
* UFW Firewall Configuration
* Log Rotation
* Infrastructure Hardening
* Health Monitoring
* Idempotent Automation

---

## Prerequisites

Before running the project, ensure you have:

* Ubuntu Linux (or a compatible distribution)
* Bash shell
* sudo privileges
* Internet connectivity for package installation

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/TitoRerimoi/02-linux-automation.git
```

Navigate into the project:

```bash
cd 02-linux-automation
```

Make the provisioning script executable:

```bash
chmod +x scripts/kijanikiosk-provision.sh
```

Run the provisioning script:

```bash
./scripts/kijanikiosk-provision.sh
```

---

## Key DevOps Concepts

* Infrastructure Provisioning
* Linux Hardening
* Principle of Least Privilege
* Service Management
* Automation
* Monitoring and Verification
* Idempotency

---

## Future Improvements

* Convert the Bash automation to Ansible
* Containerize services using Docker
* Implement CI/CD with GitHub Actions
* Add monitoring using Prometheus and Grafana
* Provision infrastructure using Terraform

