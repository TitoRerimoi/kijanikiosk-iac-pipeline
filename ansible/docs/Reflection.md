# Project Reflection

This project significantly improved my understanding of Infrastructure as Code and configuration management.

Before starting the project, I understood the individual concepts of AWS, Terraform, Linux, Git and Ansible. Through implementation, I learnt how these technologies integrate into a complete DevOps workflow.

One of the biggest lessons was understanding Terraform modules. Initially, I found it difficult to differentiate between the root module and child modules. Implementing reusable EC2 modules demonstrated how infrastructure can be defined once and reused multiple times through variables and the for_each meta-argument.

Another major learning experience involved Terraform state management. Running terraform plan after deployment and observing "No changes" reinforced the concept of desired state and idempotency.

The Ansible portion of the project highlighted the importance of automation after infrastructure provisioning. Rather than manually connecting to multiple servers, a single playbook was able to configure every EC2 instance consistently. Troubleshooting SSH host verification, inventory configuration and service management provided practical experience similar to real-world infrastructure engineering.

Git also played a significant role throughout the project. I encountered issues involving accidentally committing Terraform provider binaries and learned the importance of maintaining an effective .gitignore file to prevent sensitive or unnecessary files from entering version control.

If additional time were available, I would implement a remote Terraform backend using Amazon S3 with DynamoDB state locking, replace the static inventory with a fully dynamic inventory plugin, organise the Ansible project using Roles, and implement CI/CD using GitHub Actions.

Overall, this project strengthened my confidence in designing, provisioning, configuring and managing cloud infrastructure using industry-standard DevOps tools.
