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
4. rm -f main.zip
5. wget https://github.com/gerardmortel/nfs-storage-for-fyre/archive/refs/heads/main.zip
6. unzip main.zip
7. rm -f main.zip
8. cd nfs-storage-for-fyre-main
9. ./01_driver.sh | install_nfs.log
