# nfs-storage-for-fyre
# https://github.ibm.com/gmortel/nfs-storage-for-fyre

1. ssh into the infrastructure node
2. On the infrastructure node, copy, paste then run the 01_create-nfs-storage-directories.sh
3. Back on a linux computer with the OpenShift CLI installed, edit 02_setup-env.sh to ensure all values are correct.
4. Run the driver.sh file which runs 02_setup-env.sh and 03_create-nfs-storage.sh
