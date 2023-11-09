# nfs-storage-for-fyre
[https://github.com/gerardmortel/nfs-storage-for-fyre](https://github.com/gerardmortel/nfs-storage-for-fyre)

# Purpose
The purpose of this repo is create NFS storage on IBM Fyre.

# Prerequisites
1. OpenShift cluster on Fyre

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip
3. cd
4. rm -f main.zip
5. rm -rf nfs-storage-for-fyre-main
6. wget https://github.com/gerardmortel/nfs-storage-for-fyre/archive/refs/heads/main.zip
7. unzip main.zip
8. rm -f main.zip
9. cd nfs-storage-for-fyre-main
10. #STOP! Put your values for variables inside file 02_setup_env.sh
11. ./01_driver.sh | tee install_nfs.log
