#!/bin/bash

### OpenShift Cluster info
#export CLUSTER_USER="kubeadmin"
#export CLUSTER_PASS="nW8au-sSkIS-pnQhI-5u2Gw"
#export CLUSTER_URL="https://api.tumefy.cp.fyre.ibm.com:6443"
#export NFSSERVER="10.17.2.117"
export NFSSERVER=$(ip addr | awk -F' ' '$0 ~ /inet 10/{print $2}' | cut -d/ -f1)

### Log in to the OCP cluster as a cluster administrator.
#oc login ${CLUSTER_URL} --username=${CLUSTER_USER} --password=${CLUSTER_PASS}

### Cloud Pak for Business Automation namespace/project
export CP4BANAMESPACE="cp4ba"

### Preparing Storage Option 1, Dynamic Storage using a storage class
### https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/21.0.x?topic=operator-preparing-log-file-storage
#export STORAGECLASS="ocs-storagecluster-cephfs" # OCS Storage
export STORAGECLASS="nfs-managed-storage" # NFS Storage

### Preparing Storage Class Option 2, Static Storage using PVs and PVCs
### https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/21.0.x?topic=operator-preparing-log-file-storage
#export NFSSERVER="10.17.96.163"
export NFSSERVEROPERATORPATH="/data/nfsshare/operator"
export NFSSERVERLOGSPATH="/data/nfsshare/logs"
