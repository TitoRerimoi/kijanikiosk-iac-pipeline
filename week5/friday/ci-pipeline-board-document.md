# KijaniKiosk Continuous Integration Pipeline – Board Overview

## Introduction

Every software change introduces the possibility of improving the product or introducing unexpected problems. To reduce this risk, KijaniKiosk uses an automated Continuous Integration (CI) pipeline. Whenever a developer submits new code, the pipeline automatically checks the quality of that change before it can be considered ready for release. This approach provides consistency, reduces manual work, and gives the team confidence that every approved version has passed the same quality standards.

## Pipeline Stages

| Stage | Purpose |
|--------|---------|
| Lint | Checks the code for formatting and coding standard issues. |
| Build | Compiles and prepares the application for deployment. |
| Verify | Runs automated tests and security checks in parallel to validate functionality and identify vulnerabilities. |
| Archive | Stores the build output as a traceable artifact. |
| Publish | Makes the approved artifact available in the organization's package repository for future deployment. |

## What Happens During a Build

A developer pushes code to the shared repository. Jenkins automatically detects the change and starts the pipeline.

The first step checks whether the code follows agreed development standards. If issues are found, processing stops immediately. This prevents unnecessary use of computing resources on code that already requires correction.

If the quality checks succeed, the application is built into a deployable package. Automated testing and security verification then run simultaneously. Running these checks in parallel reduces waiting time while ensuring both quality and security receive equal attention.

Once all verification steps pass successfully, the build output is archived. This creates a permanent record of exactly what was produced during that build. The final stage publishes the approved artifact to the internal package repository using secure credentials managed outside the source code.

## What Happens When Something Goes Wrong

The pipeline is intentionally designed to stop when a problem is detected. If code quality checks fail, later stages do not execute because producing an artifact from known faulty code would waste resources and reduce confidence in the software.

If automated tests fail, the build is marked unsuccessful and developers receive immediate feedback so they can correct the issue before additional work continues. Security checks behave similarly, ensuring vulnerabilities are identified before software progresses further through the delivery process.

This behaviour provides predictable quality control and ensures only verified software moves forward.

## Benefits to the Organisation

Automating these checks improves consistency because every software change follows exactly the same validation process. It reduces manual effort, shortens feedback time for developers, improves traceability through archived artifacts, and supports stronger governance by ensuring releases are repeatable and auditable.

The pipeline also creates evidence of every successful build, making it easier to investigate issues, reproduce previous releases, and demonstrate compliance with internal engineering standards.

## Current Scope

This pipeline currently focuses on continuous integration. It validates code quality, testing, security checks, artifact creation, and publishing. Future improvements could include automated deployment to development and production environments, additional monitoring, and automated rollback capabilities when deployment problems occur.
