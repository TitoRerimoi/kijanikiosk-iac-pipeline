# Integration Notes

During the project, a few integration challenges came up while combining different components.

The first challenge was balancing security with functionality. Restricting permissions improved security, but it also caused issues when the script later needed to create the health check file. The solution was to adjust the file creation step while keeping the overall permission model intact.

Another challenge involved shared log access. Multiple services needed access to the same log location, which could not be handled cleanly with standard Linux permissions alone. ACLs were used to provide the required access without opening the directory to all users.

The project also had to handle a dirty VM where users, groups or packages might already exist. Instead of assuming a clean environment, the script checks for existing resources before attempting to create them. This makes the script safer to run multiple times.

Finally, firewall and service management needed to work together. Services had to be running before health checks could report a healthy state, and firewall rules had to be applied consistently to avoid unexpected access issues.

These challenges highlighted the importance of testing, verification and making automation resilient to different starting conditions.
