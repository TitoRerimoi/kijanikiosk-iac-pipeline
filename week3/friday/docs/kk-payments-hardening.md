# kk-payments Hardening

## Service Account

* Dedicated service account: kk-payments
* Non-login shell: /usr/sbin/nologin

## Service Controls

* Managed through systemd
* Automatic restart enabled
* Enabled on boot

## Filesystem Controls

* Group-based permissions applied
* ACL controlled access to shared logs

## Network Controls

* UFW enabled
* Required ports explicitly allowed
* Default deny inbound policy applied

## Result

The service runs using a dedicated non-privileged account with controlled access to system resources.
