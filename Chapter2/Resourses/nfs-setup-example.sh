#!/bin/bash
helm install --set nfs.server=192.168.100.7 --set nfs.path=/data stable/nfs-client-provisioner --set storageClass.name=default --set storageClass.defaultClass=true

#kubectl patch storageclass default -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
