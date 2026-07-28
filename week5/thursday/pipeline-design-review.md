# Week 5 Pipeline Design Review

## Objective

The KijaniKiosk payments pipeline was designed to provide fast, repeatable and reliable continuous integration while preventing defective code from progressing toward deployment.

## Design Principles

### 1. Fail Fast
The pipeline executes the Lint stage before Build. This prevents unnecessary resource usage by stopping immediately when coding errors are detected.

### 2. Automated Verification
Verification consists of automated unit testing and dependency security auditing, reducing manual quality assurance effort.

### 3. Parallel Execution
The Verify stage runs Test and Security Audit simultaneously. This reduces total execution time while maintaining independent validation.

### 4. Clean Build Environment
The pipeline cleans the workspace after every execution using `cleanWs()`, preventing previous builds from affecting subsequent executions.

### 5. Controlled Build Execution
Concurrent executions are disabled using `disableConcurrentBuilds()`. Build history is limited using `buildDiscarder()` and execution time is restricted with `timeout()`.

## Improvement Implemented

Timeouts, build retention, timestamps and workspace cleanup were added to improve pipeline reliability, traceability and resource management.

## Conclusion

The pipeline follows continuous integration best practices by validating code quality before packaging and preparing software for release.
