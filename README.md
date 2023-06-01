# nfs-storage-for-fyre
# https://github.com/gerardmortel/nfs-storage-for-fyre

# Purpose
The purpose of this repo is create NFS storage on IBM Fyre.

# Prerequisites
1. OpenShift cluster on Fyre

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip
3. cd
4. wget https://github.com/gerardmortel/nfs-storage-for-fyre/archive/refs/heads/main.zip
5. unzip main.zip
6. rm -f main.zip
7. cd nfs-storage-for-fyre-main
8. ./01_driver.sh
