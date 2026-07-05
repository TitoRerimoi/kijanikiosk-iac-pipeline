#!/bin/bash

set -euo pipefail
LOGFILE="/tmp/kijanikiosk-provision.log"
log() {
    echo "[$(date '+%F %T')] $1"
}
phase() {
    echo
    echo "================================================"
    echo "$1"
    echo "================================================"
}

phase "Phase 1 - Package Installation and Validation"

log "Checking package holds"

if apt-mark showhold | grep -q "^curl$"; then
    log "Detected held package: curl"
else
    log "No held curl package found"
fi

log "Updating package cache"
sudo apt update

log "Installing required packages"

sudo apt install -y \
    acl \
    nginx \
    logrotate \
    ufw \
    curl

log "Verifying packages"

command -v nginx >/dev/null \
    && log "PASS: nginx installed" \
    || log "FAIL: nginx missing"

command -v ufw >/dev/null \
    && log "PASS: ufw installed" \
    || log "FAIL: ufw missing"

command -v logrotate >/dev/null \
    && log "PASS: logrotate installed" \
    || log "FAIL: logrotate missing"

command -v getfacl >/dev/null \
    && log "PASS: acl package installed" \
    || log "FAIL: acl package missing"

phase "Phase 2 - Users and Groups"

log "Checking kijanikiosk group"

if getent group kijanikiosk >/dev/null; then
    log "Detected existing group: kijanikiosk"
else
    sudo groupadd kijanikiosk
    log "Created group: kijanikiosk"
fi

log "Checking service accounts"

for user in kk-api kk-payments kk-logs; do
    if id "$user" >/dev/null 2>&1; then
        log "Detected existing user: $user"
    else
        sudo useradd -r -s /usr/sbin/nologin -g kijanikiosk "$user"
        log "Created user: $user"
    fi
done

log "Verifying users"

for user in kk-api kk-payments kk-logs; do
    id "$user" >/dev/null 2>&1 \
        && log "PASS: $user exists" \
        || log "FAIL: $user missing"
done

getent group kijanikiosk >/dev/null \
    && log "PASS: kijanikiosk group exists" \
    || log "FAIL: kijanikiosk group missing"

phase "Phase 3 - Directory Structure and ACLs"

log "Creating directory structure"

sudo mkdir -p /opt/kijanikiosk/config
sudo mkdir -p /opt/kijanikiosk/shared/logs
sudo mkdir -p /opt/kijanikiosk/health

log "Fixing ownership"

sudo chown -R root:kijanikiosk /opt/kijanikiosk

log "Fixing permissions"

sudo chmod 750 /opt/kijanikiosk/config
sudo chmod 2775 /opt/kijanikiosk/shared/logs
sudo chmod 775 /opt/kijanikiosk/health

log "Applying ACLs"

sudo setfacl -m g:kijanikiosk:rwx /opt/kijanikiosk/shared/logs
sudo setfacl -d -m g:kijanikiosk:rwx /opt/kijanikiosk/shared/logs

log "Verifying directory structure"

for dir in \
    /opt/kijanikiosk/config \
    /opt/kijanikiosk/shared/logs \
    /opt/kijanikiosk/health
do
    [[ -d "$dir" ]] \
        && log "PASS: $dir exists" \
        || log "FAIL: $dir missing"
done

log "Verifying ACLs"

getfacl /opt/kijanikiosk/shared/logs | grep -q "group:kijanikiosk:rwx" \
    && log "PASS: ACL applied" \
    || log "FAIL: ACL missing"

phase "Phase 4 - systemd Services"

log "Creating systemd service files"

sudo tee /etc/systemd/system/kk-api.service >/dev/null <<'EOF'
[Unit]
Description=KijaniKiosk API

[Service]
Type=simple
User=kk-api
ExecStart=/usr/bin/sleep infinity
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo tee /etc/systemd/system/kk-payments.service >/dev/null <<'EOF'
[Unit]
Description=KijaniKiosk Payments

[Service]
Type=simple
User=kk-payments
ExecStart=/usr/bin/sleep infinity
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo tee /etc/systemd/system/kk-logs.service >/dev/null <<'EOF'
[Unit]
Description=KijaniKiosk Logs

[Service]
Type=simple
User=kk-logs
ExecStart=/usr/bin/sleep infinity
Restart=always

[Install]
WantedBy=multi-user.target
EOF

log "Reloading systemd"

sudo systemctl daemon-reload

log "Enabling services"

sudo systemctl enable kk-api
sudo systemctl enable kk-payments
sudo systemctl enable kk-logs

log "Starting services"

sudo systemctl restart kk-api
sudo systemctl restart kk-payments
sudo systemctl restart kk-logs

log "Verifying services"

for svc in kk-api kk-payments kk-logs; do
    systemctl is-active --quiet "$svc" \
        && log "PASS: $svc active" \
        || log "FAIL: $svc inactive"
done

phase "Phase 5 - Firewall Configuration"

log "Checking firewall rules"

if sudo ufw status numbered | grep -q "3001.*DENY"; then
    log "Detected dirty firewall rule on port 3001"
fi

log "Resetting firewall"

sudo ufw --force reset

sudo ufw default deny incoming
sudo ufw default allow outgoing

log "Allowing application ports"

sudo ufw allow 3000/tcp
sudo ufw allow 3001/tcp

sudo ufw --force enable

log "Verifying firewall"

sudo ufw status | grep -q "3000/tcp" \
    && log "PASS: Port 3000 allowed" \
    || log "FAIL: Port 3000 missing"

sudo ufw status | grep -q "3001/tcp" \
    && log "PASS: Port 3001 allowed" \
    || log "FAIL: Port 3001 missing"

phase "Phase 6 - Verification"

log "Verifying services"

for svc in kk-api kk-payments kk-logs; do
    systemctl is-active --quiet "$svc" \
        && log "PASS: $svc running" \
        || log "FAIL: $svc not running"
done

log "Verifying directories"

for dir in \
    /opt/kijanikiosk/config \
    /opt/kijanikiosk/shared/logs \
    /opt/kijanikiosk/health
do
    [[ -d "$dir" ]] \
        && log "PASS: $dir exists" \
        || log "FAIL: $dir missing"
done

phase "Phase 7 - Journal Persistence and Log Rotation"

log "Configuring journal persistence"

sudo mkdir -p /var/log/journal

sudo systemd-tmpfiles --create --prefix /var/log/journal

log "Creating logrotate configuration"

sudo tee /etc/logrotate.d/kijanikiosk >/dev/null <<'EOF'
/opt/kijanikiosk/shared/logs/*.log {
    daily
    rotate 7
    missingok
    compress
    notifempty
    create 0640 root kijanikiosk
}
EOF

log "PASS: logrotate configuration created"

phase "Phase 8 - Monitoring Health Checks"

sudo tee /opt/kijanikiosk/health/health.json >/dev/null <<EOF
{
  "status": "healthy",
  "services": {
    "kk-api": "$(systemctl is-active kk-api)",
    "kk-payments": "$(systemctl is-active kk-payments)",
    "kk-logs": "$(systemctl is-active kk-logs)"
  }
}
EOF

log "PASS: health.json created"

cat /opt/kijanikiosk/health/health.json

echo
echo "Provisioning completed."
