# Access Model

## Users

* kk-api
* kk-payments
* kk-logs

## Group

* kijanikiosk

## Directory Permissions

| Directory                    | Owner | Group       | Permissions |
| ---------------------------- | ----- | ----------- | ----------- |
| /opt/kijanikiosk/config      | root  | kijanikiosk | 750         |
| /opt/kijanikiosk/shared/logs | root  | kijanikiosk | 2775        |
| /opt/kijanikiosk/health      | root  | kijanikiosk | 775         |

## ACLs

Configured on:

* /opt/kijanikiosk/shared/logs

ACL Entries:

* group:kijanikiosk:rwx
* default:group:kijanikiosk:rwx

## Security Outcome

Dedicated service accounts use least privilege and shared resources are controlled through group permissions and ACLs.
