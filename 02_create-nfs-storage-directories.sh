#!/bin/bash

# # Create the directory for the operator
mkdir -p /data/nfsshare/operator

# Create the directory for the logs
mkdir -p /data/nfsshare/logs

#Allow full access to both directories
chmod -R 777 /data/nfsshare

# Add new entries for operator and log to /etc/export file
for ip in $(oc get nodes -o wide | grep -Ev INTERNAL-IP | awk '{ print $6 }'); do echo "/data/nfsshare        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports; echo "/data/nfsshare/operator        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports ; echo "/data/nfsshare/logs        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports ; done

# Make exportfs entries in /etc/export file permanent
exportfs -rav

# Display the internal ip address needed for a future step.  It starts with 10.
#ip addr | grep "inet 10"
ip addr | awk -F' ' '$0 ~ /inet 10/{print $2}' | cut -d/ -f1
echo ""
