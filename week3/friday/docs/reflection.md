# Reflection

## 1. At what point during the project did you discover that two requirements were in conflict? Describe the conflict and what you learned from resolving it.

I ran into a conflict near the end of the project when generating the health.json file. Earlier in the project I had tightened permissions on the application directories as part of the hardening process. When the script later tried to write the health check file, it failed with a permission denied error. I realized that making a system secure is not enough if legitimate processes can no longer do their job. Resolving the issue helped me understand that security and usability need to be balanced rather than treated separately.

## 2. The hardening decisions document is written for Nia. Rewrite one sentence from that document in the technical language you would use if writing it for Tendo instead. What is lost and what is gained in the translation?

For Nia:

"Dedicated service accounts were created to improve security and reduce unnecessary access."

For Tendo: 

"Each service was assigned a dedicated non-login account following the principle of least privilege."

The simpler version is easier for a non-technical audience to understand. The technical version is more precise and communicates the actual security approach being used.

## 3. Looking at the provisioning script as a whole, what is the single most fragile part of it? What would you need to know about the target environment to make that part robust?

I think the most fragile part is the firewall and service configuration. The script assumes that the target machine uses UFW and systemd. That worked fine in my test environment, but a different Linux distribution might use different tools or configurations. To make it more reliable, I would need to know the operating system, service manager, firewall solution, and any organization-specific security requirements before running the script in production.
