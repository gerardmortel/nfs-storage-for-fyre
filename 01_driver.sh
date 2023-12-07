#!/bin/bash

. ./02_setup-env.sh
./03_create-nfs-storage-directories.sh
./04_create-nfs-storage.sh
./05_make_storage_class_default.sh