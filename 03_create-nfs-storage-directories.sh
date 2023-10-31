#!/bin/bash

echo "#### Create the directory for the operator"
mkdir -p ${NFSOPERATORPATH}

echo "#### Create the directory for the logs"
mkdir -p ${NFSLOGSPATH}

echo "#### Allow full access to both directories"
chmod -R 777 ${NFSBASEPATH}

echo "#### Add new entries for operator and log to /etc/export file"
for ip in $(oc get nodes -o wide | grep -Ev INTERNAL-IP | awk '{ print $6 }'); do 
    echo "${NFSBASEPATH}        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports;
    echo "${NFSOPERATORPATH}        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports ;
    echo "${NFSLOGSPATH}        $ip(rw,sync,insecure,no_wdelay,no_root_squash)" >> /etc/exports ;
done

echo "#### Make exportfs entries in /etc/export file permanent"
exportfs -rav

echo ""
echo "#### For Fyre, display the internal ip address needed for a future step.  It starts with 10."
#ip addr | grep "inet 10"
ip addr | awk -F' ' '$0 ~ /inet 10/{print $2}' | cut -d/ -f1
echo ""
