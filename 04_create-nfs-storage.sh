#!/bin/bash

echo "#### Create the namespace"
oc create namespace ${CP4BANAMESPACE}

echo "#### Apply the RBAC"
oc apply -f yaml/01_nfs-client-provisioner-rbac.yaml

echo "#### Assign the hostmount-anyuid Security Context Constraint (SCC) to the nfs-client-provisioner service account in the ${CP4BANAMESPACE} namespace"
oc adm policy add-scc-to-user hostmount-anyuid system:serviceaccount:${CP4BANAMESPACE}:nfs-client-provisioner

echo "#### Create the new-nfs-client-provisioner-deployment.yaml with variable substitution"
cat << EOF > yaml/new-nfs-client-provisioner-deployment.yaml
kind: Deployment
apiVersion: apps/v1
metadata:
  name: nfs-client-provisioner
  namespace: cp4ba
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nfs-client-provisioner
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      serviceAccountName: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          image: k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: cp4ba/nfs-client					# you can change this name to what your own chosen name
            - name: NFS_SERVER
              value: ${NFSSERVER}		# change to a real NFS server name
            - name: NFS_PATH
              value: ${NFSLOGSPATH}							# adjust as needed
      volumes:
        - name: nfs-client-root
          nfs:
            server: ${NFSSERVER}		# chnage to a real NFS server name
            path: ${NFSLOGSPATH}							# adjust as needed
EOF

echo "#### Apply the previously created deployment yaml"
oc apply -f yaml/new-nfs-client-provisioner-deployment.yaml

echo "#### Apply the following storage class"
oc apply -f yaml/04_nfs-managed-storage-storageclass.yaml

echo "#### Apply the following persistent volume claim (PVC)"
oc apply -f yaml/05_nfs-managed-storage-pvc.yaml

echo "#### Create the following test pod"
oc apply -f yaml/06_testpod.yaml
