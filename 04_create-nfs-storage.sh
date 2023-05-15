#!/bin/bash

# Create the namespace
oc create namespace ${CP4BANAMESPACE}

# Apply the RBAC
oc apply -f yaml/01_nfs-client-provisioner-rbac.yaml

# Assign the hostmount-anyuid Security Context Constraint (SCC) to the nfs-client-provisioner service account in the cp4ba namespace.
oc adm policy add-scc-to-user hostmount-anyuid system:serviceaccount:cp4ba:nfs-client-provisioner

# Make a copy of the
cp yaml/03_nfs-client-provisioner-deployment.yaml yaml/new-nfs-client-provisioner-deployment.yaml
sed -ri "s|<NFSSERVER>|${NFSSERVER}|g" yaml/new-nfs-client-provisioner-deployment.yaml

# Add the ip address of the infrastructure server then apply the following deployment yaml
oc apply -f yaml/new-nfs-client-provisioner-deployment.yaml

# Apply the following storage class
oc apply -f yaml/04_nfs-managed-storage-storageclass.yaml

# Apply the following persistent volume claim (PVC)
oc apply -f yaml/05_nfs-managed-storage-pvc.yaml

# Apply the following test pod
oc apply -f yaml/06_testpod.yaml
