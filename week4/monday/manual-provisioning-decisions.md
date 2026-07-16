# Manual Provisioning Decisions - KijaniKiosk API Server

| Decision | Value I chose | Reason |
|-----------|---------------|--------|
| Cloud provider | Multipass | Local VM for learning without cloud costs |
| Region | Local machine | Multipass runs locally |
| Operating system | Ubuntu 22.04 LTS | Lab requirement |
| Instance type | 1 CPU, 1 GB RAM | Smallest configuration required |
| VPC | N/A (Multipass) | Local VM has virtual networking instead of cloud VPC |
| Subnet | Default Multipass network | Automatically assigned |
| Security group | N/A | Multipass does not use cloud security groups |
| SSH key pair | Automatically managed by Multipass | Multipass handles authentication |
| Root volume size | 5 GB | Lab requirement |
| Public IP? | No | Local VM only |
| Tags / labels | kijanikiosk-api | VM name |
