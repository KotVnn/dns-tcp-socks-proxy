#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "Please run this script with root privileges."
    exit 1
fi

# Move and rename the dns_proxy file
echo "Moving dns_proxy file to /usr/bin"
mv ./dns_proxy /usr/bin/

# Move the dns_proxy.conf file to /etc
echo "Moving dns_proxy.conf file to /etc"
mv ./dns_proxy.conf /etc/

# Move and rename resolv.conf file
echo "Moving and renaming resolv.conf to /etc/resolv-dns-proxy.conf"
mv ./resolv.conf /etc/resolv-dns-proxy.conf

# Move the dns_proxy.service file to /etc/systemd/system/
echo "Moving dns_proxy.service file to /etc/systemd/system/"
mv ./dns_proxy.service /etc/systemd/system/

# Reload systemd configuration
echo "Reloading systemd configuration"
systemctl daemon-reload

# Enable the service to start on boot
echo "Enabling dns_proxy service to start on boot"
systemctl enable dns_proxy
systemctl start dns_proxy

echo "Done! Files have been moved and the dns_proxy service has been set up to start on boot."
