# Hardening Decisions

The goal of this project was to create a more secure and manageable server foundation using basic hardening practices.

Separate service accounts were created for kk-api, kk-payments and kk-logs so that each service runs independently rather than sharing the same identity. These accounts were also configured with non-login shells because they are only intended to run services.

Permissions were restricted using standard Linux permissions and ACLs to ensure that only the required users and groups can access application files and shared logs. This follows the principle of least privilege and reduces unnecessary access.

The firewall was enabled to limit network exposure and allow only the required traffic. Services were managed using systemd to provide a consistent way to start, stop and monitor them.

Journal persistence and log rotation were configured to improve troubleshooting and prevent log files from consuming excessive disk space over time. A simple health check output was also added to provide visibility into service status after provisioning.

These controls improve security and operational visibility, but they do not protect against application vulnerabilities, compromised credentials or other advanced threats. Additional monitoring and security controls would still be required in a real production environment.
