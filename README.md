# nfs-storage-for-fyre
# https://github.ibm.com/gmortel/nfs-storage-for-fyre

# Purpose
The purpose of this repo is create NFS storage on IBM Fyre.

# Prerequisites
1. OpenShift cluster on Fyre

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git
3. git clone https://github.ibm.com/gmortel/nfs-storage-for-fyre
4. cd nfs-storage-for-fyre
5. ./01_driver.sh
