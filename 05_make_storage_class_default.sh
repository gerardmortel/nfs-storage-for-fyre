#!/bin/bash

echo "#### Make the storage class the default."
oc patch storageclass \
${STORAGECLASS} \
-p '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "true"}}}'