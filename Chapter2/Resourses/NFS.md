

# Setup NFS server



## Install ubuntu
Install an ubuntu machine.

```
apt-get update
apt-get install nfs-kernel-server -y
```

## Via Openstack volumes
1. Create a volume.
2. Attach to machine. (probably get /dev/sdb )

```
fdisk /dev/sdb

n
p
1
w
q

```

```
mkfs.xfs /dev/sdb1
```

## Add local folder.
Example /data
```
mkdir /data
```
```
chown nobody:nogroup /data
```
Add mount to fstab.  (make sure the whitespaces are aligned)
```
/dev/sdb1          /data     xfs    defaults           0  0
```

## Edit exports (according to your needs.)
```
/data       192.168.100.0/24(rw,sync,no_subtree_check)
```
This will share the /data volume on all nodes in the subnet.

Enable
```
systemctl enable nfs-kernel-server
```
If everything is allright you should se the status online with the following command:
```
systemctl status nfs-kernel-server
```

## On client nodes (all cluster nodes that you expect mounts to occur).

```
apt-get update
apt-get install nfs-common
```
