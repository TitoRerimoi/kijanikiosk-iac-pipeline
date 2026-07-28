# Week 5 – Fault Injection Log

| Stage Faulted | Fault Introduced | Expected Behaviour | Observed | Explanation |
|---------------|------------------|--------------------|----------|-------------|
| Lint | Introduced a syntax error into the source file | Build, Verify, Archive and Publish stages were skipped | Yes | The pipeline stopped immediately after the Lint stage, demonstrating the fail-fast principle. |
| Build | Used an invalid `npm ci` command | Verify, Archive and Publish stages were skipped | Yes | The Build stage failed, preventing downstream stages from executing. |
| Test | Added a deliberately failing assertion | Security Audit completed, Archive and Publish were skipped | Yes | Parallel execution allowed the Security Audit to finish while the failed Test stage prevented publishing. |
| Publish | Used an incorrect credential ID | Archive completed, artifact remained in Jenkins but was not published to Nexus | Yes | Publishing failed due to authentication, protecting the repository from unauthorised uploads. |
